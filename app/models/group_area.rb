class GroupArea < ActiveRecord::Base
	belongs_to :group
	belongs_to :tagged_area
end
