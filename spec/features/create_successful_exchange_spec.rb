require "rails_helper"

describe "create successful exchange process", type: :feature do
  it "sucessfully create a successful exchange" do
    valid_sign_in
    click_on "Listings"
    create_listing("Flowers")
    offer = create(:offer, listing: Listing.last)
    click_on "Listings"
    click_on "Flowers"
    click_on "ACCEPT"
    click_link "COMPLETE"
  end
end
