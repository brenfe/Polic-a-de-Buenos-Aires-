require "application_system_test_case"

class PolicemenTest < ApplicationSystemTestCase
  setup do
    @policeman = policemen(:one)
  end

  test "visiting the index" do
    visit policemen_url
    assert_selector "h1", text: "Policemen"
  end

  test "creating a Policeman" do
    visit policemen_url
    click_on "New Policeman"

    fill_in "Person", with: @policeman.person_id
    fill_in "Police station", with: @policeman.police_station_id
    click_on "Create Policeman"

    assert_text "Policeman was successfully created"
    click_on "Back"
  end

  test "updating a Policeman" do
    visit policemen_url
    click_on "Edit", match: :first

    fill_in "Person", with: @policeman.person_id
    fill_in "Police station", with: @policeman.police_station_id
    click_on "Update Policeman"

    assert_text "Policeman was successfully updated"
    click_on "Back"
  end

  test "destroying a Policeman" do
    visit policemen_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Policeman was successfully destroyed"
  end
end
