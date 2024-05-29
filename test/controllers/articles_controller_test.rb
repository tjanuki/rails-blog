require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success

    post articles_url, params: { article: { title: "can create", body: "article successfully.", status: 'public' } }

    assert_response :redirect
    follow_redirect!

    assert_response :success
    assert_select "h1", "can create"
    assert_select "p", "article successfully."

    assert_equal 1, Article.where(title: "can create").count
  end

  test "should get show" do
    get article_url(Article.first), headers: { "HTTP_REFERER" => "http://example.com/home" }

    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(Article.first)
    assert_response :success
  end

  test "should update article" do
    patch article_url(Article.first), params: { article: { title: "can update", body: "article successfully.", status: 'public' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "can update"
    assert_select "p", "article successfully."
  end
end
