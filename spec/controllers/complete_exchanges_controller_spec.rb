require "rails_helper"

RSpec.describe CompleteExchangesController, type: :controller do
  describe "POST #create" do
    it "user complete and exchange" do
      user = create(:user)
      valid_sign_in(user)
      listing = create(:listing)
      offer = create(:offer, listing: listing)
      exchange = create(:exchange, listing: listing, offer: offer)
      # p "exchange no.#{exchange.id}"

      post :create, id: exchange.id

      expect(response).to redirect_to successful_exchanges_path
    end
  end
end
