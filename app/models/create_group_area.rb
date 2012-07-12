class CreateGroupArea < ActiveRecord::Base
   validates_presence_of :name

   def self.lookup(names)
   	return self.select(:lng, :lat).where('name == names')
   end
end
