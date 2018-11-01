class ExchangesController < ApplicationController
  # def index
  #   @exchanges = Exchange.all
  #   respond_to do |format|
  #     format.html  
  #     format.json  { render json: @exchanges }
  #     format.xml { render xml: @exchanges }
  #   end
  # end

  def show
    @exchange = Exchange.find(params[:id])
    @comment = Comment.new
  end
end
