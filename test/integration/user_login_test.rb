require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:michael)
    @valid_params = { user: { email: @user.email, password: 'foobar' } }
  end

  test "successfully signs in a user" do
    get new_user_session_path
    assert_select 'input[value=?]', 'Log in'
    post user_session_path, params: @valid_params

    follow_redirect!
    assert_equal "/", path
  end

  test "doesn't allow visitors to view dashboard" do
    get dashboard_path
    assert_equal 302, status

    follow_redirect!
    assert_equal "/users/sign_in", path
    assert_equal 200, status

    post user_session_path, params: @valid_params
    get dashboard_path
    assert_equal 200, status

    assert_select "a[href=?]", new_user_session_path,       count: 0
    assert_select "a[href=?]", destroy_user_session_path,   count: 1
    assert_select "a[href=?]", edit_user_registration_path, count: 1
  end
end
