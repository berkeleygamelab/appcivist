require 'test_helper'

class ResponseChallengesControllerTest < ActionController::TestCase
  setup do
    @response_challenge = response_challenges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:response_challenges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create response_challenge" do
    assert_difference('ResponseChallenge.count') do
      post :create, response_challenge: @response_challenge.attributes
    end

    assert_redirected_to response_challenge_path(assigns(:response_challenge))
  end

  test "should show response_challenge" do
    get :show, id: @response_challenge.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @response_challenge.to_param
    assert_response :success
  end

  test "should update response_challenge" do
    put :update, id: @response_challenge.to_param, response_challenge: @response_challenge.attributes
    assert_redirected_to response_challenge_path(assigns(:response_challenge))
  end

  test "should destroy response_challenge" do
    assert_difference('ResponseChallenge.count', -1) do
      delete :destroy, id: @response_challenge.to_param
    end

    assert_redirected_to response_challenges_path
  end
end
