require 'test_helper'

class NewUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_user_index_url
    assert_response :success
  end

  test "should get create" do
    get new_user_create_url
    assert_response :success
  end

end
