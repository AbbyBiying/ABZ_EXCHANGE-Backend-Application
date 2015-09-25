class SuccessfulExchangesController < ApplicationController
  def index
    @successful_exchanges = SuccessfulExchange.all
  end

  def successful_exchange_params
    params.require(:successful_exchanges).permit(
      :rating
      )
  end
end
