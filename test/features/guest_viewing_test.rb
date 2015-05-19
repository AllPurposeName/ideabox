require 'test_helper'

class GuestViewingTest < ActionController::TestCase
  include Capybara::DSL
  test "As a guest I can see a list of all existing ideas, including the title, body, and quality for each idea on the index." do
    visit '/ideas'

    within(".CatchScurvy") do
      assert page.has_content?("CatchScurvy")
      assert page.has_content?("be sure not to eat any fruit")
      assert page.has_content?("Scallywag's Swill!")
    end

    within(".CountGold") do
      assert page.has_content?("CountGold")
      assert page.has_content?("one two three four...")
      assert page.has_content?("Old Salt's Cordial!")
    end
  end
end
