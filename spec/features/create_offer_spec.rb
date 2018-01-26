require "rails_helper"

describe "create offer process", type: :feature do
  it "sucessfully create an offer" do
    existing_listing = create(:listing, name: "Existing Listing")
    valid_sign_in
    click_on "Listings"
    click_on "Existing Listing"
    fill_in "Name", with: "Glass"
    fill_in "Description", with: "White one"
    within(:css, ".offer") do
      click_button "Submit"
    end
  end
end
