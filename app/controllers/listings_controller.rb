class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = find_by_name
    @offer = Offer.new
    @comment = Comment.new
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      flash[:notice] = "Listing was successfully created!"
      redirect_to @listing
    else
      render :new
    end
  end

  def edit
    @listing = find_by_name
  end

  def update
    listing = find_by_name
    if listing.update(listing_params)
      flash[:notice] = "Listing was successfully updated!"
      redirect_to listing
    else
      render :edit
    end
  end

  def destroy
    listing = find_by_name
    listing.destroy
    flash[:notice] = "Listing was successfully deleted!"

    redirect_to root_path
  end

  private

  def require_permission
    if current_user != find_by_name.user
      flash[:error] = "You do not have the permission to do it."

      redirect_to dashboard_index_path
    end
  end

  def find_by_name
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
