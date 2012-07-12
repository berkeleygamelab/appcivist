class TaggedArea < ActiveRecord::Base
  has_many :group_areas
  has_many :user_ares
	has_many :groups, :through => :group_areas
	has_many :coordinates, :foreign_key => "tagged_area_id"
	has_many :users, :through => :user_areas
	
	
	def grab_items(type)
     set = self.coordinates
     @table = ENV['csb_locations']
     lineEquation = ""
     set.each do |point|
       lat = point.lat
       lng = point.lng
       lineEquation += "LATLNG(#{lat}, #{lng}),"
     end
     lineEquation = lineEquation[0..lineEquation.length-2]
        arrayOfIds = []
     type.each do |x|
    
     hashSet = ::FT.execute "SELECT * FROM #{@table} WHERE ST_INTERSECTS(Location, POLYGON(#{lineEquation})) AND Type = '#{x}' "
       hashSet.each do |set|
          arrayOfIds += [set[:id].to_i]
        end
     end
     return ItemTemplate.where(:id => arrayOfIds)
   end
  
end
