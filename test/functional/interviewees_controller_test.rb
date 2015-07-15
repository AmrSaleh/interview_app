require 'test_helper'

class IntervieweesControllerTest < ActionController::TestCase
  setup do
    @interviewee = interviewees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interviewees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interviewee" do
    assert_difference('Interviewee.count') do
      post :create, interviewee: { cv: @interviewee.cv, name: @interviewee.name }
    end

    assert_redirected_to interviewee_path(assigns(:interviewee))
  end

  test "should show interviewee" do
    get :show, id: @interviewee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interviewee
    assert_response :success
  end

  test "should update interviewee" do
    put :update, id: @interviewee, interviewee: { cv: @interviewee.cv, name: @interviewee.name }
    assert_redirected_to interviewee_path(assigns(:interviewee))
  end

  test "should destroy interviewee" do
    assert_difference('Interviewee.count', -1) do
      delete :destroy, id: @interviewee
    end

    assert_redirected_to interviewees_path
  end
end
