class SearchesController < ApplicationController
  def show
    @comments = Comment.textcomments(textcomment_ids)
    @users = User.where("username ILIKE ?", "%#{params[:search]}%")
  end

  private

  def textcomment_ids
    Textcomment.search(params[:search]).pluck(:id)
  end
end
