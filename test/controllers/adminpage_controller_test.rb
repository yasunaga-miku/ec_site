require "test_helper"

class AdminpageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get adminpage_show_url
    assert_response :success
  end
end
