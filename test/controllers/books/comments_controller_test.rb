require "test_helper"

class Books::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get books_comments_create_url
    assert_response :success
  end
end
