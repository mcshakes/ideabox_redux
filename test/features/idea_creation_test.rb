require 'test_helper'

class IdeaCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user sees greeting banner" do
    visit root_path
    within(".banner") do
      assert page.has_content?("Welcome to IdeaBox - The Sequel!")
    end
    within(".collection") do
      assert page.has_content?("Your Bright Ideas")
    end
  end

  test "user can create an idea" do
    visit root_path
    click_link_or_button("Add New Idea")
    
  end

end
