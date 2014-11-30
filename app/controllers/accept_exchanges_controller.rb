class AcceptExchangesController < ApplicationController
  before_action :require_login
  before_filter :require_permission, only: [:create]

  def create
    exchange = Exchange.create(offer: offer, listing: listing)

    redirect_to exchange_path(exchange)
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
