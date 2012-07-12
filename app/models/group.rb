class Group < ActiveRecord::Base
	has_many :tagged_areas, :through => :group_areas
	has_many :users, :through => :memberships
	has_one :item_template, :as => :item
	has_many :response_templates, :as => :responder
	has_many :sent_messages, :as => :sender
	
	def generate_content
		return {"picture" => picture}
	end
end