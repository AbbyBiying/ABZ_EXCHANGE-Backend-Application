class ListingsController < ApplicationController
  before_action :require_login, except: [:index]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = find_listing
    @offer = Offer.new
    @comment = Comment.new
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def edit
    @listing = find_listing
  end

  def update
    listing = find_listing
    if listing.update(listing_params)
      redirect_to listing
    else
      render :edit
    end
  end

  def destroy
    listing = find_listing
    listing.destroy

    redirect_to root_path
  end

  private

  def require_permission
    if current_user != find_listing.user
      flash[:error] = "You do not have the right to do it."

      redirect_to dashboard_path
    end
  end

  def find_listing
    Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(
      :avatar,
      :description,
      :name,
      :listing_id,
      :url,
      :user_id
      )
  end
end
