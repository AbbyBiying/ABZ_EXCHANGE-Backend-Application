class SearchesController < ApplicationController
  def show
    @comments = Comment.text_comments(text_comment_ids)
    @listings = Listing.find_listing(params[:search])
    @offers = Offer.find_offer(params[:search])
    @images = Image.find_image(params[:search])
    @users = User.find_user(params[:search])
  end

  private

  def text_comment_ids
    TextComment.search(params[:search]).pluck(:id)
  end
end
