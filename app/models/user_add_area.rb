class UserAddArea < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :when
    validates_presence_of :uid
end
