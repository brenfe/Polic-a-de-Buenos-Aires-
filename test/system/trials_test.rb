require "application_system_test_case"

class TrialsTest < ApplicationSystemTestCase
  setup do
    @trial = trials(:one)
  end

  test "visiting the index" do
    visit trials_url
    assert_selector "h1", text: "Trials"
  end

  test "creating a Trial" do
    visit trials_url
    click_on "New Trial"

    fill_in "Date", with: @trial.date
    fill_in "Details", with: @trial.details
    fill_in "Employee", with: @trial.employee_id
    fill_in "Report", with: @trial.report_id
    click_on "Create Trial"

    assert_text "Trial was successfully created"
    click_on "Back"
  end

  test "updating a Trial" do
    visit trials_url
    click_on "Edit", match: :first

    fill_in "Date", with: @trial.date
    fill_in "Details", with: @trial.details
    fill_in "Employee", with: @trial.employee_id
    fill_in "Report", with: @trial.report_id
    click_on "Update Trial"

    assert_text "Trial was successfully updated"
    click_on "Back"
  end

  test "destroying a Trial" do
    visit trials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trial was successfully destroyed"
  end
end
