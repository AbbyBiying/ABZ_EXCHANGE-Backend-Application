class SearchesController < ApplicationController
  def show
		@comments = Comment.find_comment(params[:search])
		@listings = Listing.find_by_name(params[:search])
		@offers = Offer.find_by_name(params[:search])
		@images = Image.find_by_name(params[:search])
		@users = User.find_user_by_username(params[:search])
		@groups = Group.find_by_name(params[:search])

    @results_found = @comments.any? || @offers.any? || @listings.any? || @users.any? || @images.any? || @groups.any?
  end
end
