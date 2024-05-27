require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit articles_url
  
    assert_selector "h1", text: "Articles"
  end

  test "creating a Article" do
    visit articles_url
    click_on "New Article"

    fill_in "Title", with: @article.title
    fill_in "Body", with: @article.body
    click_on "Create Article"

    assert_text "Article was successfully created"
    click_on "Back"
  end
end
