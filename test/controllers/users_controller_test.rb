# test/controllers/users_controller_test.rb
require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  # Helper method to log in a user
  def log_in_as(user)
    post login_path, params: { session: { email: user.email, password: 'password' } }
  end

  test "should get index" do
    log_in_as(@user) # Log in before making requests that require authentication
    get users_url
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    log_in_as(@user)
    assert_difference("User.count") do
      post users_url, params: { user: { username: 'newuser', email: 'new@example.com', password: 'password' } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    log_in_as(@user)
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user) # Ensure the user is logged in
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    log_in_as(@user)
    patch user_url(@user), params: { user: { username: 'updateduser' } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    log_in_as(@user)
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
