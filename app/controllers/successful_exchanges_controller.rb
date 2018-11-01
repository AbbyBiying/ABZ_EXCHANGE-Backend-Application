class SuccessfulExchangesController < ApplicationController
  def index
    @successful_exchanges = SuccessfulExchange.all
    respond_to do |format|
      format.html
      format.json { render json: @successful_exchanges }
      format.xml { render xml: @successful_exchanges }
    end
  end

  def successful_exchange_params
    params.require(:successful_exchanges).permit(
      :rating
      )
  end 
end
