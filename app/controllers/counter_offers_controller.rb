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
    find_offer
    @counter_offer = current_user.counter_offers.new(counter_offer_params)

    if @counter_offer.save
      redirect_to @offer
    else
      redirect_to @offer
    end
  end

  def edit
    find_offer
    @counter_offer = @offer.counter_offers.find(params[:id])
  end

  def update
    find_offer
    @counter_offer = @offer.counter_offers.find(params[:id])

    if @counter_offer.update(counter_offer_params)
      redirect_to @offer
    else
      render :edit
    end
  end

  def destroy
    offer = Offer.find(params[:offer_id])
    counter_offer = offer.counter_offers.find(params[:id])
    counter_offer.destroy

    redirect_to offer
  end

  private

  def require_permission
    if current_user != find_counter_offer.user
      flash[:error] = "You do not have the right to do it."

      redirect_to @offer
    end
  end

  def find_offer
    @offer = Offer.find(params[:offer_id])
  end

  def find_counter_offer
    @counter_offer ||= CounterOffer.find(params[:id])
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
