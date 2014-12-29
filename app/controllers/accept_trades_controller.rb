class AcceptTradesController < ApplicationController
  before_action :require_login
  before_filter :require_permission, only: [:create]

  def create
    trade = Trade.create(offer: offer, listing: listing)

    redirect_to trade_path(trade)
  end

  def require_permission
    if current_user != listing.user
      flash[:notice] = "You do not have the right to do it."

      redirect_to listing
    end
  end

  def offer
    @offer ||= Offer.find(params[:id])
  end

  def listing
    @listing ||= offer.listing
  end
end
