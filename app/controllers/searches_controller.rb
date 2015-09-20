class SearchesController < ApplicationController
  def show
    @comments = Comment.find_comment(params[:search])
    @listings = Listing.find_listing(params[:search])
    @offers = Offer.find_offer(params[:search])
    @images = Image.find_image(params[:search])
    @users = User.find_user(params[:search])
    @groups = Group.find_group(params[:search])
  end

end
