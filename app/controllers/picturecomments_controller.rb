class PicturecommentsController < ApplicationController
  before_action :require_login

  def create
    @image = Image.find(params[:image_id])
    @picturecomment = Picturecomment.new(picturecomment_params)

    if @picturecomment.save
      current_user.comments.create(content: @picturecomment, image_id: @image.id)
      redirect_to @image
    else
      redirect_to :back
    end
  end

  def picturecomment_params
    params.require(:picturecomment).permit(:url)
  end
end
