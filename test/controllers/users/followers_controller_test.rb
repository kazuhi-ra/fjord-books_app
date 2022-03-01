# frozen_string_literal: true

require 'test_helper'

class Users::FollowersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get users_followers_index_url
    assert_response :success
  end
end
