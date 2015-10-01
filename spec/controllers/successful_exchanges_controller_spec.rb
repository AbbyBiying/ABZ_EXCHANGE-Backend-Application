require "rails_helper"

RSpec.describe SuccessfulExchangesController, type: :controller do
  describe "GET #index" do
    it "show all successful exchanges" do
      user = create(:user)
      sign_in(user)
      listing = create(:listing)
      offer = create(:offer, listing: listing)
      exchange = create(:exchange, listing: listing, offer: offer)
      successful_exchange = create(:successful_exchange, exchange: exchange)

      get :index

      expect(response).to render_template (:index)
    end
  end
end
