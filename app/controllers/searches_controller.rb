class SearchesController < ApplicationController
  def show
    @comments = Comment.text_comments(text_comment_ids)
    @users = User.find_user(params[:search])
  end

  private

  def text_comment_ids
    TextComment.search(params[:search]).pluck(:id)
  end
end
