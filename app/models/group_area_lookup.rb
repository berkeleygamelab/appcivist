class GroupAreaLookup < ActiveRecord::Base
   has_many :Users
   belongs_to :CreateGroupArea

   validates_presence_of :mapid
   validates_numericality_of :uid
end
