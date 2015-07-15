require 'test_helper'

class VacantJobsControllerTest < ActionController::TestCase
  setup do
    @vacant_job = vacant_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacant_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vacant_job" do
    assert_difference('VacantJob.count') do
      post :create, vacant_job: { avail_places: @vacant_job.avail_places, name: @vacant_job.name }
    end

    assert_redirected_to vacant_job_path(assigns(:vacant_job))
  end

  test "should show vacant_job" do
    get :show, id: @vacant_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vacant_job
    assert_response :success
  end

  test "should update vacant_job" do
    put :update, id: @vacant_job, vacant_job: { avail_places: @vacant_job.avail_places, name: @vacant_job.name }
    assert_redirected_to vacant_job_path(assigns(:vacant_job))
  end

  test "should destroy vacant_job" do
    assert_difference('VacantJob.count', -1) do
      delete :destroy, id: @vacant_job
    end

    assert_redirected_to vacant_jobs_path
  end
end
