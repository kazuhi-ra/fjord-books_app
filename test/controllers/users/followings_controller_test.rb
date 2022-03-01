# frozen_string_literal: true

require 'test_helper'

class Users::FollowingsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get users_followings_index_url
    assert_response :success
  end
end
