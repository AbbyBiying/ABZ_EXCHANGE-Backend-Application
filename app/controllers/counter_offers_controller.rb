class CounterOffersController < ApplicationController
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def index
    @counter_offers = CounterOffer.all
  end

  def new
    @counter_offer = CounterOffer.new
  end

  def show
    find_counter_offer
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @counter_offer = current_user.counter_offers.new(counter_offer_params)

    if @counter_offer.save
      redirect_to @offer
    else
      redirect_to @offer
    end
  end

  private

  def require_permission
    if current_user != find_counter_offer.user
      flash[:error] = "You do not have the right to do it."

      redirect_to @offer
    end
  end

  def find_counter_offer
    @counter_offer ||= Counter_offer.find(params[:id])
  end

  def counter_offer_params
    params.require(:counter_offer).permit(
      :description,
      :name,
      :offer_id,
      :url,
      :user_id
      ).merge(offer: @offer)
  end
end
