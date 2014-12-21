class TradesController < ApplicationController
  def show
    @trade = Trade.find(params[:id])
  end
end
