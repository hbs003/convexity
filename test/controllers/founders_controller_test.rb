require 'test_helper'

class FoundersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get founders_new_url
    assert_response :success
  end

  test "should get edit" do
    get founders_edit_url
    assert_response :success
  end

  test "should get show" do
    get founders_show_url
    assert_response :success
  end

end
