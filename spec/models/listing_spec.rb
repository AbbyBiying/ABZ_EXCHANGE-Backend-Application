require "rails_helper"

RSpec.describe Listing, type: :model do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:description)}

  describe "accepted?" do
    # Classicist Test
    it "should return true if the listing has been accepted" do
      exchange = create(:exchange)

      expect(exchange.listing.accepted?).to eql true
    end

    it "should return false if the listing has not been accepted" do
      offer = create(:offer)

      expect(offer.listing.accepted?).to eql false
    end

    # Mockist Test
    it "should return true if the listing has been accepted" do
      listing = Listing.new
      dummy = double()
      exchange = double("exchange", "present?" => dummy)

      expect(listing).to receive(:exchange).and_return(exchange)
      expect(listing.accepted?).to eql dummy
    end


    it "should return true if the listing has been accepted" do
      listing = Listing.new
      exchange_presence = double("exchange_presence")

      expect(listing).to receive_message_chain("exchange.present?").and_return(exchange_presence)
      expect(listing.accepted?).to eql exchange_presence
    end
  end
end
