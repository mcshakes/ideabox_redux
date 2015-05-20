require 'test_helper'

class IdeasControllerTest < ActionController::TestCase

  test "#index" do
    Idea.create(title: "vcr tests", body: "my own personal hell")

    get :index, format: :json

    ideas = JSON.parse(response.body, symbolize_names: true)
    idea = ideas.first

    assert_response :success
    assert_equal "vcr tests", idea[:title]
    assert_equal "my own personal hell", idea[:body]
  end

  test "#show" do
    skip
    Idea.create(title: "vcr tests", body: "my own personal hell")

    get :show, format: :json, id: "1"
    first_idea = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "vcr tests", first_idea[:title]
    assert_equal "my own personal hell", first_idea[:body]
  end

  test "#update" do
    original = Idea.create(title: "vcr tests", body: "my own personal hell")

    put :update, format: :json, id: original.id, idea: { title: "tests", body: "not as easy as tutorial"}
    new_one = Idea.find(original.id)

    assert_response :success
    assert_equal "tests", new_one.title
    assert_equal "not as easy as tutorial", new_one.body
  end

  test "#create" do
    skip
    post :create, format: :json, idea: { title: "turmeric", body: "need to add to grocery list"}

    assert_response :success
    assert_equal "turmeric", idea[:title]
    assert_equal "need to add to grocery list", idea[:body]
  end
end
