require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new
    assert_not article.save
  end

  test "should not save article without body" do
    article = Article.new
    article.title = "Title"
    assert_not article.save
  end

  test "should not save article with body less than 10 characters" do
    article = Article.new
    article.title = "Title"
    article.body = "Body"
    assert_not article.save
  end

  test "should not save article without status" do
    article = Article.new
    article.title = "Title"
    article.body = "Body longer than 10 characters"
    assert_not article.save
  end

  test "should save article with title and body" do
    article = Article.new
    article.title = "Title"
    article.body = "Body longer than 10 characters"
    article.status = "public"

    assert article.save, article.errors.full_messages.to_sentence
  end
end
