class TextCommentsController < ApplicationController
  before_action :require_login

  def create
    @image = Image.find(params[:image_id])
    @text_comment = TextComment.new(text_comment_params)

    if @text_comment.save
      current_user.comments.
        create(content: @text_comment, image_id: @image.id)
      redirect_to @image
    else
      redirect_to :new
    end
  end

  def text_comment_params
    params.require(:text_comment).permit(:body)
  end
end
