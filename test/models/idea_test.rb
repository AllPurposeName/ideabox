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

  test "it is only created with a valid title and body" do
    blank = Idea.new()
    no_title = Idea.new(body: "There's no title tho")
    no_body = Idea.new(title: "There's no body tho")
    just_right = Idea.new(title: "seems legit", body: "yeah this too")

    refute blank.save
    refute no_title.save
    refute no_body.save
    assert just_right.save
  end
end
