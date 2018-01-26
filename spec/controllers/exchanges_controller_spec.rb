require "rails_helper"

RSpec.describe ExchangesController, type: :controller do
  describe "POST #create" do
    it "create an exchange" do
      user = create(:user)
      valid_sign_in(user)
      listing = create(:listing, user: user)
      offer = create(:offer, listing: listing)
      exchange = create(:exchange, listing: listing, offer: offer)

      get :show, id: exchange.id

      expect(response).to render_template(:show)
    end
  end
end
