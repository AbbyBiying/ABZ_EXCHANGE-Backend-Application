module Features

  def create_listing(name = "My Listing Name")
    visit listings_path
    click_on "Make New Listing"
    fill_in "Name", with: name
    fill_in "Description", with: "My listing description."
    click_on "Create Listing"
    expect(page).to have_content name
    expect(page).to have_content "My listing description."
  end

end
