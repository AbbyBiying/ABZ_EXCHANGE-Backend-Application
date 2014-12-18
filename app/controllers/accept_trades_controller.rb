class AcceptTradesController < ApplicationController
  before_filter :require_permission, only: [:create]

  def create
    Trade.create(offer: offer, counter_offer: counter_offer)

    redirect_to offer
  end

  def require_permission
    if current_user != offer.user
      flash[:notice] = "You do not have the right to do it."

      redirect_to offer
    end
  end

  def counter_offer
    @counter_offer ||= CounterOffer.find(params[:id])
  end

  def offer
    @offer ||= counter_offer.offer
  end
end
