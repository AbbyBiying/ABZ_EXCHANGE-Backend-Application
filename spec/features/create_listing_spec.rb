require "rails_helper"

describe "create listing process", type: :feature do
  it "sucessfully create a listing" do
    valid_sign_up
    create_listing("Flowers")
    # click_on "Listings"
    # visit listings_path
    # click_on "Make New Listing"
    # visit new_listing_path
    # fill_in "name", with: "Cup"
    # fill_in "description", with: "Red one"
    # click_button "Create Listing"
  end
end
