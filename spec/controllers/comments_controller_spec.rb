require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    it "create a comment" do
      user = create(:user)
      sign_in(user)
      image = create(:image, user: user)

      post :create, comment: { commentable_id: image.id, commentable_type: "Image", body: "comment body" }

      expect(response).to redirect_to image
    end
  end

  describe "PATCH #update" do
    it "update a comment" do
      user = create(:user)
      sign_in(user)
      image = create(:image, user: user)
      comment = create(:comment, commentable: image, body: "old comment body", user: user)

      patch :update, id: comment.id, comment: { commentable_id: image.id, commentable_type: "Image", body: "new comment body" }

      expect(response).to redirect_to image_path comment.commentable
    end
  end

  describe "DELETE #destroy" do
    it "delete a comment" do
      user = create(:user)
      sign_in(user)
      image = create(:image, user: user)
      comment = Comment.create(body: "exsiting comment body", commentable_id: image.id, commentable_type: "Image")

      delete :destroy, id: comment.id

      expect(response).to redirect_to root_path
    end
  end
end
