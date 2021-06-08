require "test_helper"

class PolicemenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @policeman = policemen(:one)
  end

  test "should get index" do
    get policemen_url
    assert_response :success
  end

  test "should get new" do
    get new_policeman_url
    assert_response :success
  end

  test "should create policeman" do
    assert_difference('Policeman.count') do
      post policemen_url, params: { policeman: { person_id: @policeman.person_id, police_station_id: @policeman.police_station_id } }
    end

    assert_redirected_to policeman_url(Policeman.last)
  end

  test "should show policeman" do
    get policeman_url(@policeman)
    assert_response :success
  end

  test "should get edit" do
    get edit_policeman_url(@policeman)
    assert_response :success
  end

  test "should update policeman" do
    patch policeman_url(@policeman), params: { policeman: { person_id: @policeman.person_id, police_station_id: @policeman.police_station_id } }
    assert_redirected_to policeman_url(@policeman)
  end

  test "should destroy policeman" do
    assert_difference('Policeman.count', -1) do
      delete policeman_url(@policeman)
    end

    assert_redirected_to policemen_url
  end
end
