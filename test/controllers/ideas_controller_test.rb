require 'test_helper'

class IdeasControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json

    first_idea = JSON.parse(response.body, symbolize_names: true)[:idea].first
    assert_idea = Idea.third

    assert_response :success

    assert_equal assert_idea.id, first_idea[:id]
    assert_equal assert_idea.title, first_idea[:title]
    assert_equal assert_idea.body, first_idea[:body]
  end

  test "#show" do
    original_idea_id = Idea.find_by(title: "CountGold").id
    get :show, format: :json, id: (original_idea_id)

    assert_response :success

    idea = JSON.parse(response.body, symbolize_names: true)

    assert_equal original_idea_id, idea[:id]
    assert_equal "CountGold", idea[:title]
    assert_equal "one two three four...", idea[:body]
  end

  test "#create" do
    params = {title: "Titular", body: "Make some titles", status: 2}

    assert_difference("Idea.count", 1) do
      post :create, format: :json, idea: params
    end
    new_idea = JSON.parse(response.body, symbolize_names: true)[:idea]
    last_idea = Idea.last
    assert_response :success

    assert_equal (last_idea.id), new_idea[:id]
    assert_equal "Titular", new_idea[:title]
    assert_equal "Make some titles", new_idea[:body]
  end

  test "#update" do
    params = {title: "Updatin", body: "Call me the update guy"}
    idea = Idea.find_by(title: "CatchScurvy")
    put :update, format: :json, idea: params, id: idea.id

    assert_response :success

    later_idea = Idea.find_by(id: idea.id)

    assert_equal idea.id, later_idea.id
    assert_equal "Updatin", later_idea.title
    assert_equal "Call me the update guy", later_idea.body
  end

  test "#destroy" do
    assert_difference("Idea.count", -1) do
      delete :destroy, id: Idea.find_by(title: "CountGold").id, format: :json
    end

    assert_response :success
  end
end
