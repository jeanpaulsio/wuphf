require 'test_helper'

class DemoWuphfTest < ActiveSupport::TestCase
  def setup
    @demo_wuphf = demo_wuphfs(:bark)
  end

  test "demo_wuphf should be valid" do
    assert @demo_wuphf.valid?
  end

  # From and To Validations
  test "from name should be present" do
    @demo_wuphf.from = "  "
    assert_not @demo_wuphf.valid?
  end

  test "to name should be present" do
    @demo_wuphf.to = "   "
    assert_not @demo_wuphf.valid?
  end

  # Phone Validations
  test "phone number should be present" do
    @demo_wuphf.phone = "  "
    assert_not @demo_wuphf.valid?
  end

  test "phone validation should accept valid phone numbers" do
    valid_phone_numbers = ["909-123-4567", "9091234567", "909.123.4567"]

    valid_phone_numbers.each do |valid_number|
      @demo_wuphf.phone = valid_number
      assert @demo_wuphf.valid?, "#{valid_number.inspect} should be valid"
    end
  end

  test "phone validation should reject invalid phone numbers" do
    invalid_phone_numbers = ["909-123-457", "909", "909.12.234"]

    invalid_phone_numbers.each do |invalid_number|
      @demo_wuphf.phone = invalid_number
      assert_not @demo_wuphf.valid?, "#{invalid_number.inspect} should be invalid"
    end
  end

  # Message Validations
  test "message should be present" do
    @demo_wuphf.message = "   "
    assert_not @demo_wuphf.valid?
  end

  test "message should be no longer than 140 characters" do
    @demo_wuphf.message = "a" * 141
    assert_not @demo_wuphf.valid?
  end

  # Email Validations
  test "email should be present" do
    @demo_wuphf.email = "   "
    assert_not @demo_wuphf.valid?
  end

  test "email should be no longer than 255 characters" do
    @demo_wuphf.email = "a" * 255 + "@example.com"
    assert_not @demo_wuphf.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @demo_wuphf.email = valid_address
      assert @demo_wuphf.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @demo_wuphf.email = invalid_address
      assert_not @demo_wuphf.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be saved as lower case" do
    mixed_case_email = "FoO@EXamPle.com"
    @demo_wuphf.email = mixed_case_email
    @demo_wuphf.save
    assert_equal mixed_case_email.downcase, @demo_wuphf.reload.email
  end

  # Twitter Handle Validations
  test "twitter handle should exist" do
    @demo_wuphf.twitter_handle = "  "
    assert_not @demo_wuphf.valid?
  end

  test "twitter handle should be no longer than 15 characters" do
    @demo_wuphf.twitter_handle = "a" * 16
    assert_not @demo_wuphf.valid?
  end

end
