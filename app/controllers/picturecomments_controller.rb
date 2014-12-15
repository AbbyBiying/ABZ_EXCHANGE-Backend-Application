class PicturecommentsController < ApplicationController
  before_action :require_login

  def create
    @image = Image.find(params[:image_id])
    @picturecomment = Picturecomment.new(picturecomment_params)
    @textcomment = Textcomment.new
    @picturecomment.user = current_user

    if @picturecomment.save
      @image.comments.create(content: @picturecomment)
      redirect_to @image
    else
      redirect_to :back
    end
  end

  def picturecomment_params
    params.require(:picturecomment).permit(:url).merge(user: current_user)
  end
end
