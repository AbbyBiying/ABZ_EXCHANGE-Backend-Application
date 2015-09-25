require "rails_helper"

describe "create offer process", type: :feature do

  it "sucessfully create an offer" do
    existing_listing = create(:listing, name: "Existing Listing")

    valid_sign_up

    click_on "Listings"
    click_on "Existing Listing"
    fill_in "Name", with: "Glass"
    fill_in "Description", with: "White one"

    click_button "Create Offer"

  end
end
