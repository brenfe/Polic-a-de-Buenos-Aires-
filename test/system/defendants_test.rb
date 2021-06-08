require "application_system_test_case"

class DefendantsTest < ApplicationSystemTestCase
  setup do
    @defendant = defendants(:one)
  end

  test "visiting the index" do
    visit defendants_url
    assert_selector "h1", text: "Defendants"
  end

  test "creating a Defendant" do
    visit defendants_url
    click_on "New Defendant"

    fill_in "Person", with: @defendant.person_id
    click_on "Create Defendant"

    assert_text "Defendant was successfully created"
    click_on "Back"
  end

  test "updating a Defendant" do
    visit defendants_url
    click_on "Edit", match: :first

    fill_in "Person", with: @defendant.person_id
    click_on "Update Defendant"

    assert_text "Defendant was successfully updated"
    click_on "Back"
  end

  test "destroying a Defendant" do
    visit defendants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Defendant was successfully destroyed"
  end
end
