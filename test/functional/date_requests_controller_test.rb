require 'test_helper'

class DateRequestsControllerTest < ActionController::TestCase
  setup do
    @date_request = date_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:date_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create date_request" do
    assert_difference('DateRequest.count') do
      post :create, date_request: { interview_id: @date_request.interview_id, requested_date: @date_request.requested_date }
    end

    assert_redirected_to date_request_path(assigns(:date_request))
  end

  test "should show date_request" do
    get :show, id: @date_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @date_request
    assert_response :success
  end

  test "should update date_request" do
    put :update, id: @date_request, date_request: { interview_id: @date_request.interview_id, requested_date: @date_request.requested_date }
    assert_redirected_to date_request_path(assigns(:date_request))
  end

  test "should destroy date_request" do
    assert_difference('DateRequest.count', -1) do
      delete :destroy, id: @date_request
    end

    assert_redirected_to date_requests_path
  end
end
