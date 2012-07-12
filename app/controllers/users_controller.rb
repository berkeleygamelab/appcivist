class UsersController < ApplicationController

  def random_string(len)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
     newpass = ""
     1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
     return newpass
  end

  def generate_random_authlogic()
    random_length = 10
    temp = random_string(random_length)
    temp_pwd = temp
    return temp_pwd
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def create
    #picturePotential = picture_image(params[:user][:picture])
    #params[:user][:picture] = picturePotential[0].url
    a = params[:user]
    betakey = a['betacode']
    theemail = a['email']
    confirm_beta = Betauser.where("email = ? AND betacode = ?", theemail, betakey)
    puts betakey
    puts confirm_beta
    puts "IS CONFIRM_BETA TRUE??"
    puts confirm_beta[0].nil?
    if (!confirm_beta[0].nil?)
      puts "WHY YES IT IS"
      upload = a['upload']
      a.delete('upload')
      puts "cuz you are a woman"
      @user = User.new(a)
      @user.login = a['login']
      @user.email = a['email']
      @user.location = a['location']
      @user.password = a['password']
      @user.temp_pw = @user.password
      @user.temp_pwd = generate_random_authlogic()
      if(@user.location != nil)
        a = Geocoder.coordinates(@user.location)
        @user.lat = a[0].to_s
        @user.lng = a[1].to_s
      end
      puts "WHY DONT U LOVE ME"
      puts params[:user][:picture]


      if @user.save
        if upload != nil
          picture_image(@user, upload)
        else
          @user.picture = "DEFAULT"
        end
        if params[:picture] == nil
          puts "HU HO"

        end
        puts "LE PICTURE"
        redirect_to summary_path
      else
        puts "AHAH"
        render "new"
        #redirect_to '/register'
      end
    else
      puts "FAILED BETA KEY"
      redirect_to '/register'
    end
  end

  def update
     @user = User.find(session[:user_id])

     respond_to do |format|
       if @user.update_attributes(params[:user])
         format.html { redirect_to summary_path, notice: 'Question was successfully updated.' }
         format.json { head :ok }
       else
         format.html { render action: "edit" }
         format.json { render json: @question.errors, status: :unprocessable_entity }
       end
     end
   end

  def destroy
    if not User.exists?(params[:user])
      redirect_to root_url, :notice => "User not found"
    else
      @u = User.find(params[:user])
    end
    @u.destroy
    respond_to do |format|
      format.html {redirect_to root_url, :notice => "User destroyed!"}
      format.xml {head :ok}
    end
  end

  def profile
    if (!User.find(params[:id]).nil?)
      @user = User.find(params[:id])
      # @followed_user = current_user.followees.where(:followee_id => @user_id).size != 0
      @items = ItemTemplate.where(:user_id => params[:id]).paginate(:page => params[:page], :per_page => 15)
    end
  end

  respond_to :json

  def recent
    @user = User.find(session[:user_id])
    redirect_to
    respond_with(@user.recent_activity)
  end

  def validate
    id = params[:user]
    val = params[:token]
    @validated = false
    if(val != nil and id != nil)
      @validated = (User.where(:id => id).first.temp_pwd == val)
      user = User.where(:id => id).first
      if @validated
         user.verified = @validated
         user.password = user.password_digest
         user.save
       end

    end
  end

  def picture_image(user, pictureed_file)
    puts "attempting to do shit with the image"
    name =  pictureed_file.original_filename

         #create the file path
        path = File.join("tmp", name)
        # write the file
       File.open(path, "wb") { |f| f.write(pictureed_file.read) }

      #a = 0 / 0
      item = Fleakr.upload(path)
      user.picture = "DEFAULT"
      if item != nil
        if item[0] != nil
          user.picture = item[0].url
        end
      end
     user.save
  end

end
