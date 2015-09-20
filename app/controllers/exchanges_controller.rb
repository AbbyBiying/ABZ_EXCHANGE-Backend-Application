class ExchangesController < ApplicationController
  def show
    @exchange = Exchange.find(params[:id])
    @comment = Comment.new
  end

  def index
    @exchanges = Exchange.all
  end
end
