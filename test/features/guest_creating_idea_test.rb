require 'test_helper'

class GuestCreatingIdeaTest < ActionController::TestCase
  include Capybara::DSL
  test "As a guest I see 2 text boxes for entering the 'Title' and 'Body' for a new idea, and a 'Save' button for committing that idea on the index." do
    visit '/ideas'

    within(".new_idea") do
      assert page.has_field?("Title")
      assert page.has_field?("Body")
      assert page.has_button?("Save New Idea", disabled: false)
    end
  end
end
