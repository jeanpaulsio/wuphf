require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should redirect a user who is not logged in" do
    get dashboard_path
    assert_equal 302, status
  end
end
