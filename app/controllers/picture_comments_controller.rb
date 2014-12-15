class PictureCommentsController < ApplicationController
  before_action :require_login

  def create
    @image = Image.find(params[:image_id])
    @picture_comment = PictureComment.new(picture_comment_params)

    if @picture_comment.save
      current_user.comments.
        create(content: @picture_comment, image_id: @image.id)
      redirect_to @image
    else
      redirect_to :new
    end
  end

  def picture_comment_params
    params.require(:picture_comment).permit(:url)
  end
end
