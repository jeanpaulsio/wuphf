require 'test_helper'

class RecipientsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user              = users(:michael)
    @recipient         = @user.recipients.first
    @invalid_recipient = recipients(:dwight)
    @auth_headers      = @user.create_new_auth_token

    get new_api_v1_user_session_path, headers: @auth_headers

    @valid_params   = { name: "Jim", email: "jim@test.com", phone: "9091234567" }
    @invalid_params = { name: "Jim", email: "jim@test.com", phone: "invalid" }
  end

  test "recipient routes require authorization" do
    get api_v1_recipients_path, headers: {}
    assert_equal 401, status
    assert_match /Authorized users only/, @response.body

    post api_v1_recipients_path, headers: {}
    assert_equal 401, status
    assert_match /Authorized users only/, @response.body

    get api_v1_recipient_path(@recipient), headers: {}
    assert_equal 401, status
    assert_match /Authorized users only/, @response.body

    patch api_v1_recipient_path(@recipient), headers: {}
    assert_equal 401, status
    assert_match /Authorized users only/, @response.body

    delete api_v1_recipient_path(@recipient), headers: {}
    assert_equal 401, status
    assert_match /Authorized users only/, @response.body
  end

  test "GET api/v1/recipients" do
    get api_v1_recipients_path, headers: @auth_headers,
                                xhr: true

    assert_equal 200, status
    assert_equal "application/json", @response.content_type
  end

  test "POST api/v1/recipients with valid params" do
    assert_difference 'Recipient.count', 1 do
      post api_v1_recipients_path, params: @valid_params,
                                   headers: @auth_headers,
                                   xhr: true
    end

    assert_equal 201, status
    assert_equal "application/json", @response.content_type
  end

  test "POST api/v1/recipients with invalid params" do
    assert_no_difference 'Recipient.count' do
      post api_v1_recipients_path, params: @invalid_params,
                                   headers: @auth_headers,
                                   xhr: true
    end

    assert_equal 422, status
    assert_match /Validation failed/, @response.body
    assert_equal "application/json", @response.content_type
  end

  test "GET api/v1/recipients/:id" do
    get api_v1_recipient_path(@recipient), headers: @auth_headers,
                                           xhr: true

    assert_equal 200, status
    assert_equal "application/json", @response.content_type
  end

  test "GET api/v1/recipients/:id with another user's recipient" do
    get api_v1_recipient_path(@invalid_recipient), headers: @auth_headers,
                                                   xhr: true

    assert_equal 200, status
    assert_equal "null", @response.body
  end

  test "PUT api/v1/recipients/:id with valid params" do
    new_name = "Pammy"

    patch api_v1_recipient_path(@recipient), headers: @auth_headers,
                                             xhr: true,
                                             params: { name: new_name }

    assert_equal 204, status
    @recipient.reload
    assert_equal new_name, @recipient.name
  end

  test "PUT api/v1/recipients/:id with invalid params" do
    new_phone = "invalid phone number"

    patch api_v1_recipient_path(@recipient), headers: @auth_headers,
                                             xhr: true,
                                             params: { phone: new_phone }

    assert_equal 204, status
    @recipient.reload
    assert_not_equal new_phone, @recipient.phone
  end

  test "DELETE api/v1/recipients/:id" do
    assert_difference 'Recipient.count', -1 do
      delete api_v1_recipient_path(@recipient), headers: @auth_headers,
                                                xhr: true
    end

    assert_equal 204, status
  end
end
