require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to frontend" do
    get root_url
    assert_response :found
  end
end
