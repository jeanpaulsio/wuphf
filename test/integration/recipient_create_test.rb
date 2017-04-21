require 'test_helper'

class RecipientCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user           = users(:michael)
    @valid_params   = { recipient: { name: "Jim", email: "jim@test.com", phone: "9091234567" } }
    @invalid_params = { recipient: { name: "Jim", email: "jim@test.com", phone: "invalid" } }
  end

  test "successfully creates a recipient" do
    log_in_as(@user)
    get dashboard_path
    assert_equal 200, status
    assert_template 'dashboard/home'

    get new_recipient_path
    assert_template 'recipients/new'

    assert_difference 'Recipient.count', 1 do
      post recipients_path, params: @valid_params
    end

    follow_redirect!
    assert_template 'dashboard/home'
  end

  test "does not create a recipient with invalid params" do
    log_in_as(@user)
    get dashboard_path
    assert_equal 200, status
    assert_template 'dashboard/home'

    get new_recipient_path
    assert_template 'recipients/new'

    assert_no_difference 'Recipient.count' do
      post recipients_path, params: @invalid_params
    end

    follow_redirect!
    assert_template 'dashboard/home'
    assert_select 'div.alert'
  end
end
