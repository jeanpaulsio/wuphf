require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @first_message = messages(:first_message)
  end

  test "first_message should be valid" do
    assert @first_message.valid?
  end

  # Content Validations
  test "content should be present" do
    @first_message.content = ""
    assert_not @first_message.valid?
  end

  test "content should be no longer than 140 characters" do
    @first_message.content = "a" * 141
    assert_not @first_message.valid?
  end

  # Association Validations
  test "user association must be present" do
    @first_message.user_id = ""
    assert_not @first_message.valid?
  end

  test "recipient association must be present" do
    @first_message.recipient_id = ""
    assert_not @first_message.valid?
  end
end
