class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :login, :email
  has_many :user_areas
  has_many :user_categories
  has_many :tagged_areas, :through => :user_areas
  has_many :categories, :through => :user_categories
  has_many :notifications
  has_many :sent_messages
  has_many :subscriptions
  has_many :received_messages, :foreign_key => :received_by
  has_many :folders
  has_many :groups, :through => :memberships
  has_many :response_templates
  has_many :item_templates, :through => :subscriptions
  #has_and_belongs_to_many :followees, 
	#					  :class_name=>"user",
	#					  :join_table => "user_subscriptions",
	#					  :foreign_key => "follower_id",
	#					  :association_foreign_key => "followee_id"

  validates :login, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :location, :presence => true
  #validate :name_check
  after_create :send_confirmation
  attr_accessible :upload
  attr_accessor :betacode
  
  def render_image(user)
    if user.picture != nil || user.picture != "DEFAULT"
      return Fleakr.resource_from_url(user.picture, 'rb') 	
    end
  end
  
  def upload_image(user, uploaded_file)
    name =  uploaded_file.original_filename
        
    #create the file path
    path = File.join("tmp", name)

    # write the file
    File.open(path, "wb") { |f| f.write(uploaded_file.read) }
        
    item = Fleakr.upload(path)
    user.picture = "DEFAULT"
    puts item
    if item != nil && item[0] != nil
        user.picture = item[0].url
        puts "THE FUCK"
        puts item[0].url
        user.save
    end
  end
  
  def my_followed
	return item_templates
  end
  
  def name_check
    #if(self.login.strip != login)
    #  errors.add(:login, "login can't start or end with blank spaces")
    #end
    #if(self.login.split.size != 1)
    #  errors.add(:login, "login can't have any spaces in it")
    #end
  end

  
  def unfollow_user(follow_user)
	followed = User_Subscription.where(:follower_id=>id).where(:followee_id=>follow_user)
	if followed != nil
	  followed.destroy
	end
  end
  
  def send_confirmation
    temp_pwd = :temp_pwd
    mail = UserMailer.signup_notification(self, self.temp_pwd)
    mail.deliver
  end
  def recent_activity
    stuff = []
    stuff += Item_templates.order("updated_at DESC")
	return stuff
  end
  def limited_recent_activity(n)
	return recent_activity.slice(1,n)
  end
  
  def isAuthenticated
    return :verified
  end
  
  def cheatAuth(pass)
    return self.temp_pw == pass
  end
  
  def message_copys
    return self.received_messages
  end
  
  def questions
    return ItemTemplate.where(:user_id => self.id).where(:producible_type => 'Question')
  end
  
  def challenges
     return ItemTemplate.where(:user_id => self.id).where(:producible_type => 'Challenge')
  end
  
  def events
     return ItemTemplate.where(:user_id => self.id).where(:producible_type => 'Event')
  end
  
  def responses
    return ResponseTemplate.where(:user_id => self.id)
  end
  
  def get_subscriptions_of(itemType)
    subs = subscriptions
    ItemTemplate.where(:id => subs.collect(&:item_template_id)).where(:producible_type => itemType)
  end
  
  def get_subscription(id)
    subs = subscriptions
    subs.include?(id)
  end
  
end
