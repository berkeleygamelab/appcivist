class Notification < ActiveRecord::Base
	belongs_to :user
	belongs_to :item_template
end