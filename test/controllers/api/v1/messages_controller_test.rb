require 'test_helper'

class Api::V1::MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user              = users(:michael)
    @recipient         = recipients(:jim)
    @invalid_recipient = recipients(:dwight)
    @auth_headers      = @user.create_new_auth_token

    get new_api_v1_user_session_path, headers: @auth_headers

    @valid_params = {
      content: "michael to jim",
      user_id: @user.id,
      recipient_id: @recipient.id
    }
    @invalid_params = {
      content: "",
      user_id: @user.id,
      recipient_id: @recipient.id
    }
    @invalid_recipient_params = {
      content: "michael to dwight",
      user_id: @user.id,
      recipient_id: @invalid_recipient.id
    }

  end

  test "POST api/v1/messages with valid params" do
    assert_difference 'Message.count', 1 do
      post api_v1_messages_path, params: @valid_params,
                                 headers: @auth_headers,
                                 xhr: true
    end

    assert_equal 201, status
    assert_equal "application/json", @response.content_type
  end

  test "POST api/v1/messages with invalid params" do
    assert_no_difference 'Message.count' do
      post api_v1_messages_path, params: @invalid_params,
                                 headers: @auth_headers,
                                 xhr: true
    end

    assert_equal 422, status
    assert_match /Validation failed/, @response.body
    assert_equal "application/json", @response.content_type
  end

  test "POST api/v1/messages with invalid recipient" do
    assert_no_difference 'Message.count' do
      post api_v1_messages_path, params: @invalid_recipient_params,
                                 headers: @auth_headers,
                                 xhr: true
    end

    assert_equal 404, status
    assert_match /Couldn't find Recipient/, @response.body
    assert_equal "application/json", @response.content_type
  end
end
