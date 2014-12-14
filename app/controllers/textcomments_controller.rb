class TextcommentsController < ApplicationController
  before_action :require_login

  def create
    @image = Image.find(params[:image_id])
    @textcomment = Textcomment.new(textcomment_params)
    @picturecomment = Picturecomment.new

    if @textcomment.save
      @image.comments.create(content: @textcomment)
      redirect_to @image
    else
      redirect_to :back
    end
  end

  def textcomment_params
    params.require(:textcomment).permit(:body).merge(user: current_user)
  end
end
