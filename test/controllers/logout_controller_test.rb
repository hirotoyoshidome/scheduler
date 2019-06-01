require 'test_helper'

class LogoutControllerTest < ActionDispatch::IntegrationTest
  test "should get logout" do
    get logout_logout_url
    assert_response :success
  end

end
