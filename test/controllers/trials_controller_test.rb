require "test_helper"

class TrialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trial = trials(:one)
  end

  test "should get index" do
    get trials_url
    assert_response :success
  end

  test "should get new" do
    get new_trial_url
    assert_response :success
  end

  test "should create trial" do
    assert_difference('Trial.count') do
      post trials_url, params: { trial: { date: @trial.date, details: @trial.details, employee_id: @trial.employee_id, report_id: @trial.report_id } }
    end

    assert_redirected_to trial_url(Trial.last)
  end

  test "should show trial" do
    get trial_url(@trial)
    assert_response :success
  end

  test "should get edit" do
    get edit_trial_url(@trial)
    assert_response :success
  end

  test "should update trial" do
    patch trial_url(@trial), params: { trial: { date: @trial.date, details: @trial.details, employee_id: @trial.employee_id, report_id: @trial.report_id } }
    assert_redirected_to trial_url(@trial)
  end

  test "should destroy trial" do
    assert_difference('Trial.count', -1) do
      delete trial_url(@trial)
    end

    assert_redirected_to trials_url
  end
end
