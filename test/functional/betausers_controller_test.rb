require 'test_helper'

class BetausersControllerTest < ActionController::TestCase
  setup do
    @betauser = betausers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:betausers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create betauser" do
    assert_difference('Betauser.count') do
      post :create, betauser: @betauser.attributes
    end

    assert_redirected_to betauser_path(assigns(:betauser))
  end

  test "should show betauser" do
    get :show, id: @betauser.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @betauser.to_param
    assert_response :success
  end

  test "should update betauser" do
    put :update, id: @betauser.to_param, betauser: @betauser.attributes
    assert_redirected_to betauser_path(assigns(:betauser))
  end

  test "should destroy betauser" do
    assert_difference('Betauser.count', -1) do
      delete :destroy, id: @betauser.to_param
    end

    assert_redirected_to betausers_path
  end
end
