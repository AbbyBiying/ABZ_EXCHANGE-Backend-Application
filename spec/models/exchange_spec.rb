require "rails_helper"

RSpec.describe Exchange, type: :model do
  describe "completed?" do
    # Classicist Test
    it "should return true if the exchange has been completed" do
      successful_exchange = create(:successful_exchange)

      expect(successful_exchange.exchange.completed?).to eql true
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
