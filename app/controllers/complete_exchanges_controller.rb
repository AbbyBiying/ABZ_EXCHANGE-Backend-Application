class CompleteExchangesController < ApplicationController
  before_action :authenticate_user!

  def create
    @successful_exchange = SuccessfulExchange.create(exchange: exchange)
    flash[:notice] = "Successful exchange!"
    redirect_to successful_exchanges_path
  end

  def exchange
    @exchange ||= Exchange.find(params[:id])
  end
end
