class ExchangesController < ApplicationController
  def show
    @exchange = Exchange.find(params[:id])
  end

  def index
    @exchanges = Exchange.all
  end
end
