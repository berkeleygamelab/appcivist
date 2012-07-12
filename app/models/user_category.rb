class UserCategory < ActiveRecord::Base
	belongs_to :user
	belongs_to :category, :foreign_key => :cat_id
end
	