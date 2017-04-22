require 'test_helper'

class RecipientDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @user          = users(:michael)
    @recipient_one = recipients(:jim)
    @recipient_two = recipients(:pam)
  end

  test "should successfully delete recipient" do
    log_in_as(@user)
    get dashboard_path
    assert_equal 200, status
    assert_template 'dashboard/home'

    assert_difference 'Recipient.count', -1 do
      delete recipient_path(@recipient_one)
    end
  end
end
