require 'test_helper'

class ResponseQuestionsControllerTest < ActionController::TestCase
  setup do
    @response_question = response_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:response_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create response_question" do
    assert_difference('ResponseQuestion.count') do
      post :create, response_question: @response_question.attributes
    end

    assert_redirected_to response_question_path(assigns(:response_question))
  end

  test "should show response_question" do
    get :show, id: @response_question.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @response_question.to_param
    assert_response :success
  end

  test "should update response_question" do
    put :update, id: @response_question.to_param, response_question: @response_question.attributes
    assert_redirected_to response_question_path(assigns(:response_question))
  end

  test "should destroy response_question" do
    assert_difference('ResponseQuestion.count', -1) do
      delete :destroy, id: @response_question.to_param
    end

    assert_redirected_to response_questions_path
  end
end
