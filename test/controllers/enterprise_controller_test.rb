require 'test_helper'

class EnterpriseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enterprise_index_url
    assert_response :success
  end

  test "should get new" do
    get enterprise_new_url
    assert_response :success
  end

  test "should get edit" do
    get enterprise_edit_url
    assert_response :success
  end

  test "should get show" do
    get enterprise_show_url
    assert_response :success
  end

end
