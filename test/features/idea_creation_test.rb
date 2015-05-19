require 'test_helper'

class IdeaCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user sees greeting banner" do
    visit root_path
    within(".banner") do
      assert page.has_content?("Welcome to IdeaBox - The Sequel!")
    end
  end

end
