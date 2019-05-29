require 'test_helper'

class SpiderDemoControllerTest < ActionDispatch::IntegrationTest
  test "should get Beijing" do
    get spider_demo_Beijing_url
    assert_response :success
  end

  test "should get Shanghai" do
    get spider_demo_Shanghai_url
    assert_response :success
  end

  test "should get Guangzhou" do
    get spider_demo_Guangzhou_url
    assert_response :success
  end

end
