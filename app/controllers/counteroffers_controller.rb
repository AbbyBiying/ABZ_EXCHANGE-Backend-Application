class CounteroffersController < ApplicationController
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def index
    @counteroffers = Counteroffer.all
  end

  def new
    @counteroffer = Counteroffer.new
  end

  def show
    find_counteroffer
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @counteroffer = current_user.counteroffers.new(counteroffer_params)
    @counteroffer.update(offer_id: @offer.id)

    if @counteroffer.save
      redirect_to @offer
    else
      redirect_to @offer
    end
  end

  private

  def require_permission
    if current_user != Counteroffer.find(params[:id]).user
      flash[:error] = "You do not have the right to do it."

      redirect_to @offer
    end
  end

  def find_counteroffer
    @counteroffer ||= Counteroffer.find(params[:id])
  end

  def counteroffer_params
    params.require(:counteroffer).permit(
      :description,
      :name,
      :url,
      :user_id,
      :offer_id
      )
  end
end
