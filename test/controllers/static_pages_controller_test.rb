require 'test_helper'
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  '''
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "CityVision 城景视界" 
  end
  test "should get help" do
    get help_path  
    assert_response :success
    assert_select "title", "Help | CityVision 城景视界"
  end
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | CityVision 城景视界"
  end
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | CityVision 城景视界"
  end 
  '''
  test "should get density_demo" do
    get density_demo_path
    assert_response :success
    assert_select "title", "density_demo | CityVision 城景视界"
  end 

end