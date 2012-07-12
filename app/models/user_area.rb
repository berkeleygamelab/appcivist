class UserArea < ActiveRecord::Base
	belongs_to :user
	belongs_to :tagged_area
end