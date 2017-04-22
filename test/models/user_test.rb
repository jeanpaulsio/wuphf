require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name should be no longer than 20 characters" do
    @user.name = "a" * 21
    assert_not @user.valid?
  end

  test "name should be capitalized properly" do
    username   = "jimothy"
    @user.name = username
    @user.save
    assert_equal username.capitalize, @user.reload.name
  end
end
