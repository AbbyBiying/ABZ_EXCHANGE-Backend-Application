require "rails_helper"

RSpec.describe ListingsController, type: :controller do
  describe "GET #listing" do
    it "show all listings" do
      user = create(:user)
      sign_in(user)
      listing = create(:listing)
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "show a listing" do
      user = create(:user)
      sign_in(user)
      listing = create(:listing)
      get :show, id: listing.id

      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    it "edit a listing" do
      user = create(:user)
      sign_in(user)
      listing = create(:listing, user: user)
      get :edit, id: listing.id
      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH #update" do
    it "update a listing" do
      user = create(:user)
      sign_in(user)
      listing = create(:listing, user: user)

      patch :update, id: listing.id, listing: { name: "new name"}

      expect(response).to redirect_to listing
    end
  end
end
