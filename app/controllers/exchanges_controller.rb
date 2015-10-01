class ExchangesController < ApplicationController
  def show
    @exchange = Exchange.find(params[:id])
    @comment = Comment.new
  end
end
