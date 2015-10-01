require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "show all users" do
      user = create(:user)
      sign_in(user)
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "show a user" do
      user = create(:user)
      sign_in(user)
      get :show, id: user.id

      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    it "edit a user" do
      user = create(:user)
      sign_in(user)

      get :edit, id: user.id

      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH #update" do
    it "update a user" do
      user = create(:user)
      sign_in(user)

      patch :update, id: user.id, user: { name: "new name"}

      expect(response).to redirect_to root_path
    end
  end
end
