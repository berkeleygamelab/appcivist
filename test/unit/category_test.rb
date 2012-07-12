require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_auto_fill
	print "MADE IT THIS FAR \n\n\n\n\n"
	chee = category.autofill("chee")
	assert chee[0] == "cheetos"
	assert chee[1] == "cheese"

	end
	
	
end
