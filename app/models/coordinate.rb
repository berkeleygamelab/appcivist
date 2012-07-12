class Coordinate < ActiveRecord::Base
	belongs_to :tagged_area, :foreign_key => "tagged_area_id"
	def lat
	  return self.location.split(", ")[0]
  end
  def lng
    return self.location.split(", ")[1]
  end
end
