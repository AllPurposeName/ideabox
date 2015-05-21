require 'test_helper'

class GuestCreatingIdeaTest < ActionController::TestCase
  include Capybara::DSL
  test "As a guest I see 2 text boxes for entering the 'Title' and 'Body' for a new idea, and a 'Save' button for committing that idea on the index." do
    visit '/ideas'

    within(".new_idea") do
      assert page.has_field?("New Title")
      assert page.has_field?("New Body")
      assert page.has_button?("Save New Idea", disabled: false)
    end
  end

  test "A guest can add an idea and it is added to the database" do
    visit '/ideas'

    within(".new_idea") do
     fill_in "New Title", with: "Test title"
     fill_in "New Body", with: "Body test"
      assert_difference('Idea.count', 1) do
        click_link_or_button("Save New Idea")
      end
    end
  end
end
