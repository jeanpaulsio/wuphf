require 'test_helper'

class DemoWuphfTest < ActiveSupport::TestCase
  def setup
    @demo_wuphf = DemoWuphf.new(from: "Ryan", to: "Michael", message: "Test Wuphf!",
                                email: "michaelscott@test.com", phone: "9097533874",
                                twitter_handle: "jeanpaulsio")
  end

  test "demo_wuphf should be valid" do
    assert @demo_wuphf.valid?
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


end
