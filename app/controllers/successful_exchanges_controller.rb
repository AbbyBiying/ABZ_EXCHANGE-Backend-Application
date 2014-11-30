class SuccessfulExchangesController < ApplicationController
  def index
    @successful_exchanges = SuccessfulExchange.all
  end
end
