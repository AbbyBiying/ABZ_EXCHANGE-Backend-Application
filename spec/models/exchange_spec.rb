require "rails_helper"

RSpec.describe Exchange, type: :model do
  describe "completed?" do
    # Classicist Test
    it "should return true if the exchange has been completed" do
      location = Location.create!(city: "New York", state: "NY")
      user = User.create!(email: "abc@gmail.com", username: "jb", location: location, password_digest: "OIUYH")
      listing = Listing.create!(name: "apple pencil", user: user, description: "The lightning-fast responsiveness of Apple Pencil separates it from other creative tools.")
      offer = Offer.create!(name: "an apple", description: "green", user: user)
      exchange = Exchange.create!(listing: listing, offer: offer)
      successful_exchange = SuccessfulExchange.create!(exchange: exchange)

      expect(exchange.completed?).to eql true
    end
  end

    # Mockist Test
    it "should return true if the exchange has been completed" do
      exchange = Exchange.new
      successful_exchange_presence = double("successful_exchange_presence")

      expect(exchange).to receive_message_chain("successful_exchange.present?").and_return(successful_exchange_presence)

      expect(exchange.completed?).to eql successful_exchange_presence
    end
end
