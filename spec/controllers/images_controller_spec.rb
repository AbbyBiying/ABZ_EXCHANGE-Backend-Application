require "rails_helper"

RSpec.describe ImagesController, type: :controller do
  describe "GET #index" do
    it "show all images" do
      user = create(:user)
      sign_in(user)
      image = create(:image)

      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "show an image" do
      user = create(:user)
      sign_in(user)
      image = create(:image)

      get :show, id: image.id

      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    it "edit an image" do
      user = create(:user)
      sign_in(user)
      image = create(:image, user: user)

      get :edit, id: image.id

      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH #update" do
    it "update an image" do
      user = create(:user)
      sign_in(user)
      image = create(:image, user: user)

      patch :update, id: image.id, image: { name: "new name", description: "new description" }

      expect(response).to redirect_to image
    end
  end
end
