require 'test_helper'

class DiscussionControllerTest < ActionController::TestCase
  test "should get summary" do
    get :summary
    assert_response :success
  end

  test "should get specific" do
    get :specific
    assert_response :success
  end

  test "should get ask" do
    get :ask
    assert_response :success
  end

  test "should get challenge" do
    get :challenge
    assert_response :success
  end

end
