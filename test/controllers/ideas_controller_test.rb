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
end
