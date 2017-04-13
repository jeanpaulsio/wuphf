require 'test_helper'

class SendDemoWuphfTest < ActionDispatch::IntegrationTest
  test "invalid wuphf parameters" do
    get root_url

    assert_no_difference 'DemoWuphf.count' do
      post demo_wuphfs_path, params: { demo_wuphf: { from: "", to: "" } }
    end

    assert_template 'demo_wuphfs/new'
  end

  test "valid wuphf parameters" do
    get root_url

    assert_difference 'DemoWuphf.count', 1 do
      post demo_wuphfs_path, params: { demo_wuphf: { from: "Ryan", to: "Michael", message: "Test Wuphf",
                                                     email: "ryan@test.com", phone: "9097533874", twitter_handle: "wuphfwuphf" } }
    end

    follow_redirect!
    assert_template 'demo_wuphfs/new'
    assert_select 'div.alert'
    assert_select 'div.alert-success'
  end
end
