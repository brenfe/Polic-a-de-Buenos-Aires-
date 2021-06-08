require "test_helper"

class DamagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @damage = damages(:one)
  end

  test "should get index" do
    get damages_url
    assert_response :success
  end

  test "should get new" do
    get new_damage_url
    assert_response :success
  end

  test "should create damage" do
    assert_difference('Damage.count') do
      post damages_url, params: { damage: { person_id: @damage.person_id, property_id: @damage.property_id, type: @damage.type } }
    end

    assert_redirected_to damage_url(Damage.last)
  end

  test "should show damage" do
    get damage_url(@damage)
    assert_response :success
  end

  test "should get edit" do
    get edit_damage_url(@damage)
    assert_response :success
  end

  test "should update damage" do
    patch damage_url(@damage), params: { damage: { person_id: @damage.person_id, property_id: @damage.property_id, type: @damage.type } }
    assert_redirected_to damage_url(@damage)
  end

  test "should destroy damage" do
    assert_difference('Damage.count', -1) do
      delete damage_url(@damage)
    end

    assert_redirected_to damages_url
  end
end
