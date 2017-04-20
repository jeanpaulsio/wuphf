require 'test_helper'

class RecipientTest < ActiveSupport::TestCase
  def setup
    @jim = recipients(:jim)
  end

  test "name should be present" do
    @jim.name = ""
    assert_not @jim.valid?
  end

  test "name should be no longer than 25 characters" do
    @jim.name = "a" * 26
    assert_not @jim.valid?
  end

  # Email Validations
  test "email should be present" do
    @jim.email = ""
    assert_not @jim.valid?
  end

  test "email should be no longer than 255 characters" do
    @jim.email = "a" * 255 + "@example.com"
    assert_not @jim.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @jim.email = valid_address
      assert @jim.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @jim.email = invalid_address
      assert_not @jim.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be saved as lower case" do
    mixed_case_email = "FoO@EXamPle.com"
    @jim.email = mixed_case_email
    @jim.save
    assert_equal mixed_case_email.downcase, @jim.reload.email
  end

  # Phone Validations
  test "phone number should be present" do
    @jim.phone = "  "
    assert_not @jim.valid?
  end

  test "phone validation should accept valid phone numbers" do
    valid_phone_numbers = ["909-123-4567", "9091234567", "909.123.4567"]

    valid_phone_numbers.each do |valid_number|
      @jim.phone = valid_number
      assert @jim.valid?, "#{valid_number.inspect} should be valid"
    end
  end

  test "phone validation should reject invalid phone numbers" do
    invalid_phone_numbers = ["909-123-457", "909", "909.12.234"]

    invalid_phone_numbers.each do |invalid_number|
      @jim.phone = invalid_number
      assert_not @jim.valid?, "#{invalid_number.inspect} should be invalid"
    end
  end

  # Association Validations
  test "user association must be present" do
    @jim.user_id = ""
    assert_not @jim.valid?
  end

  # Twitter Handle Validations
  test "twitter handle should be no longer than 15 characters" do
    @jim.twitter_handle = "a" * 16
    assert_not @jim.valid?
  end

  test "twitter and facebook ids are optional" do
    @jim.twitter_handle = ""
    @jim.facebook_id = ""

    assert @jim.valid?
  end
end
