class OffersController < ApplicationController
  before_action :authenticate_user!
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def new
    @offer = Offer.new
  end

  def show
    find_by_name
  end

  def create
    find_listing
    @offer = @listing.offers.new(offer_params)

    if @offer.save
      flash[:notice] = "Offer was successfully created!"
      redirect_to @listing
    else
      redirect_to @listing
    end
  end

  def edit
    find_listing
    @offer = @listing.offers.find(params[:id])
  end

  def update
    find_listing
    @offer = @listing.offers.find(params[:id])

    if @offer.update(offer_params)
      flash[:notice] = "Offer was successfully updated!"
      redirect_to @listing
    else
      render :edit
    end
  end

  def destroy
    listing = find_listing
    offer = listing.offers.find(params[:id])
    offer.destroy
    flash[:notice] = "Offer was successfully deleted!"
    redirect_to listing
  end

  private

  def require_permission
    if current_user != find_by_name.user
      flash[:error] = "You do not have the permission to do it."

      redirect_to @offer.listing
    end
  end

  def find_listing
    @listing = Listing.find(params[:listing_id])
  end

  def find_by_name
    @offer ||= Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(
      :avatar,
      :description,
      :name,
      :user_id
      ).merge(listing: @listing, user: current_user)
  end
end
