require 'test_helper'

class FollowersControllerTest < ActionDispatch::IntegrationTest
  test "should get follow_user" do
    get followers_follow_user_url
    assert_response :success
  end

  test "should get unfollow_user" do
    get followers_unfollow_user_url
    assert_response :success
  end

end
