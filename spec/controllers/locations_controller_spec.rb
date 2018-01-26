require "rails_helper"

RSpec.describe LocationsController, type: :controller do
  describe "GET #location" do
    it "show all locations" do
      user = create(:user)
      valid_sign_in(user)
      location = create(:location)

      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "show a location" do
      user = create(:user)
      valid_sign_in(user)
      location = create(:location)

      get :show, id: location.id

      expect(response).to render_template(:show)
    end
  end
end
