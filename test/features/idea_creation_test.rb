require 'test_helper'

class IdeaCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user sees greeting banner" do
    skip
    visit root_path
    within(".banner") do
      assert page.has_content?("Welcome to IdeaBox - The Sequel!")
    end
    within(".collection") do
      assert page.has_content?("Your Bright Ideas")
    end
  end

  test "user doesn't see the new form until clicking" do
    skip
    visit root_path
    assert page.has_css?(".new-idea-form.hidden")
  end

  test "user can click to add idea" do
    skip
    visit root_path
    click_link_or_button("Add New Idea")
    assert page.has_content?("Title")
    assert page.has_content?("Body")
    # refute page.has_css?(".new-idea-form.hidden")
  end

  test "user can create an idea" do
    skip
    visit root_path
    click_link_or_button("Add New Idea")

    within(".new-idea-form") do
      fill_in "Title", with: "good idea"
      fill_in "Body", with: "make money"
      click_link_or_button("Create")
    end

    assert page.has_content?("good idea")
    assert page.has_content?("make money")
    assert root_path, current_path
  end

end
