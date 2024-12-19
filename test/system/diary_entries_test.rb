require "application_system_test_case"

class DiaryEntriesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit diary_entries_url

    # Ensure the navigation bar exists
    assert_selector "nav.navbar", text: "Diary App"

    # Check for the main heading
    assert_selector "h1", text: "Welcome to the app!"

    # Verify the presence of diary entry cards
    assert_selector ".custom-card", count: DiaryEntry.count
  end

  test "should create diary entry" do
    visit diary_entries_url

    # Navigate to the new diary entry page
    click_on "New Diary Entry"

    # Fill in the form
    fill_in "Title", with: "My First Diary Entry"
    fill_in "Content", with: "This is the content of my first diary entry."
    fill_in "Date", with: Date.today

    # Submit the form
    click_on "Save Diary Entry"

    # Verify success message and redirection
    assert_text "Diary entry was successfully created"
    assert_selector ".custom-card-header", text: "My First Diary Entry"
  end

  test "should update diary entry" do
    diary_entry = diary_entries(:one) # Assuming a fixture or factory is available

    visit diary_entry_url(diary_entry)

    # Navigate to the edit page
    click_on "Edit this diary entry"

    # Update the form fields
    fill_in "Title", with: "Updated Diary Entry Title"
    click_on "Save Diary Entry"

    # Verify the changes
    assert_text "Diary entry was successfully updated"
    assert_selector ".custom-card-header", text: "Updated Diary Entry Title"
  end

  test "should destroy diary entry" do
    diary_entry = diary_entries(:one)

    visit diary_entries_url

    # Find and click the destroy button for the specific diary entry
    within(".custom-card", text: diary_entry.title) do
      click_on "Destroy this diary entry"
    end

    # Confirm deletion
    page.accept_confirm

    # Verify success message and absence of the card
    assert_text "Diary entry was successfully destroyed"
    assert_no_selector ".custom-card-header", text: diary_entry.title
  end
end

