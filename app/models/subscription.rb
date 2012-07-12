class Subscription < ActiveRecord::Base
	belongs_to :item_template
	belongs_to :user
end
