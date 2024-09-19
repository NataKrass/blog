require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # Set up a user and an article before each test
  setup do
    @user = users(:one)  # Ensure you have a user fixture
    @article = articles(:one)
    log_in_as(@user)    # Simulate login
  end

  # Helper method to simulate user login
  def log_in_as(user)
    post login_url, params: { session: { email: user.email, password: 'password' } }
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { description: @article.description, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

end
