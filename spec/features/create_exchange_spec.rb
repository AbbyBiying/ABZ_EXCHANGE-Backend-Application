require "rails_helper"

describe "create exchange process", type: :feature do
  it "sucessfully create an exchange" do
    valid_sign_up
    click_on "Listings"
    create_listing("Flowers")
    offer = create(:offer, listing: Listing.last)
    click_on "Listings"
    click_on "Flowers"
    click_on "ACCEPT"
  end
end
