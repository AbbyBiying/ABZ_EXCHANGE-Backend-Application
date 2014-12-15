class TextcommentsController < ApplicationController
  before_action :require_login

  def create
    @image = Image.find(params[:image_id])
    @textcomment = Textcomment.new(textcomment_params)

    if @textcomment.save
      current_user.comments.
      create(content: @textcomment, image_id: @image.id)
      redirect_to @image
    else
      redirect_to :new
    end
  end

  def textcomment_params
    params.require(:textcomment).permit(:body)
  end
end
