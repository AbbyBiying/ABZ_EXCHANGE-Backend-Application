require "rails_helper"

RSpec.describe GroupsController, type: :controller do
  describe "GET #index" do
    it "show all groups" do
      user = create(:user)
      valid_sign_in(user)
      group = create(:group)

      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "show a group" do
      user = create(:user)
      valid_sign_in(user)
      group = create(:group)

      get :show, id: group.id

      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    it "edit a group" do
      user = create(:user)
      valid_sign_in(user)
      group = create(:group, user: user)

      get :edit, id: group.id

      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH #update" do
    it "update a group" do
      user = create(:user)
      valid_sign_in(user)
      group = create(:group, user: user)

      patch :update, id: group.id, group: { name: "new name"}

      expect(response).to redirect_to group
    end
  end
end
