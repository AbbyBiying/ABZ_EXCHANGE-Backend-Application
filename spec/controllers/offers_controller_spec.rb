require "rails_helper"

RSpec.describe OffersController, type: :controller do
  describe "POST #create" do
    it "create an offer to a listing" do
      user = create(:user)
      sign_in(user)
      listing = create(:listing, user: user)

      post :create, listing_id: listing.id, offer: { name: "offer name", description: "offer description" }

      expect(response).to redirect_to listing_path(listing)
    end
  end

  describe "GET #edit" do
    it "edit an offer" do
      user = create(:user)
      sign_in(user)
      listing = create(:listing, user: user)
      offer = create(:offer, listing: listing)

      get :edit, listing_id: listing.id, id: offer.id

      expect(response).to redirect_to listing_path(listing)
    end
  end

  describe "PATCH #update" do
    it "update an offer" do
      user = create(:user)
      sign_in(user)
      listing = create(:listing, user: user)
      offer = create(:offer, listing: listing)

      patch :update, listing_id: listing.id, id: offer.id, offer: { name: "offer name", description: "offer description" }

      expect(response).to redirect_to listing_path(listing)
    end
  end

  describe "DELETE #destroy" do
    it "delete an offer" do
      user = create(:user)
      sign_in(user)
      listing = create(:listing, user: user)
      offer = create(:offer, listing: listing)

      delete :destroy, listing_id: listing.id, id: offer.id

      expect(response).to redirect_to listing_path(listing)
    end
  end
end

