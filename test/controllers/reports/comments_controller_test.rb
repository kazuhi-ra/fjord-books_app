require "test_helper"

class Reports::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get reports_comments_create_url
    assert_response :success
  end
end
