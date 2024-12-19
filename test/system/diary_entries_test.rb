require "application_system_test_case"

class DiaryEntriesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit diary_entries_url
    # Ensure the page contains the welcome message and a new diary entry link
    assert_selector "h1", text: "Welcome to the app!"
    assert_link "New Diary Entry"
  end

  test "should create a diary entry" do
    visit diary_entries_url
    click_on "New Diary Entry" # Matches the link in your navbar

    # Fill in the form fields
    fill_in "Title", with: "My New Diary Entry"
    fill_in "Content", with: "This is a test diary entry content."
    fill_in "Date", with: Date.today

    # Submit the form
    click_on "Save Diary Entry" # Matches the submit button in your form

    # Verify the success message and redirection
    assert_text "Diary entry was successfully created"
    assert_selector ".custom-card-header", text: "My New Diary Entry"
  end

  test "should update a diary entry" do
    # Create a diary entry to update
    diary_entry = DiaryEntry.create!(title: "Initial Title", content: "Initial Content", date: Date.today)

    # Visit the entry's show page
    visit diary_entry_url(diary_entry)
    click_on "Edit this diary entry"

    # Update the fields
    fill_in "Title", with: "Updated Title"
    fill_in "Content", with: "Updated Content"

    # Submit the form
    click_on "Save Diary Entry" # Matches the submit button in your form

    # Verify the update
    assert_text "Diary entry was successfully updated"
    assert_selector ".custom-card-header", text: "Updated Title"
  end

  test "should delete a diary entry" do
    # Create a diary entry to delete
    diary_entry = DiaryEntry.create!(title: "To Be Deleted", content: "Will be removed", date: Date.today)

    # Visit the index page and delete the entry
    visit diary_entries_url
    within(".custom-card", text: diary_entry.title) do
      click_on "Destroy this diary entry"
    end

    # Verify the deletion
    assert_text "Diary entry was successfully destroyed"
    assert_no_selector ".custom-card-header", text: "To Be Deleted"
  end
end
