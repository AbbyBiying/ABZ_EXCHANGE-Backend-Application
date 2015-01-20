require "rails_helper"

RSpec.describe Listing, :type => :model do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:description)}

  describe "accepted?" do
    # Classicist Test
    it "should return true if the listing has been accepted" do
      location = Location.create!(city: "New York", state: "NY")
      user = User.create!(email: "abc@gmail.com", username: "jb", location: location, password_digest: "OIUYH")
      listing = Listing.create!(name: "apple pencil", user: user, description: "The lightning-fast responsiveness of Apple Pencil separates it from other creative tools.")
      offer = Offer.create!(name: "an apple", description: "green", user: user)
      exchange = Exchange.create!(listing: listing, offer: offer)

      expect(listing.accepted?).to eql true
    end

    it "should return false if the listing has not been accepted" do
      location = Location.create!(city: "New York", state: "NY")
      user = User.create!(email: "abc@gmail.com", username: "jb", location: location, password_digest: "OIUYH")
      listing = Listing.create!(name: "apple pencil", user: user, description: "The lightning-fast responsiveness of Apple Pencil separates it from other creative tools.")
      # offer = Offer.create!(name: "an apple", description: "green", user: user)
      # exchange = Exchange.create!(listing: listing, offer: offer)

      expect(listing.accepted?).to eql false
    end

    # Mockist Test
    it "should return true if the listing has been accepted" do
      listing = Listing.new
      offer = double("offer")
      exchange = double("exchange")

      expect(listing).to receive(:exchange).and_return(exchange)
      expect(exchange).to receive(:present?).and_return(true)
      expect(listing.accepted?).to eql true
    end
  end

end
