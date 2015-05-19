require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
   test "Idea's status is made into a funny quality" do
     swill = Idea.find_by(status: 0)
     hooch = Idea.find_by(status: 1)
     cordial = Idea.find_by(status: 2)

     assert_equal "Scallywag's Swill!", swill.quality
     assert_equal "Powder Monkey's Hooch", hooch.quality
     assert_equal "Old Salt's Cordial!", cordial.quality
     refute_equal "Powder Monkey's Hooch", swill.quality
   end
end
