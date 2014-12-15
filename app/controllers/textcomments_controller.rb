class TextcommentsController < ApplicationController
  before_action :require_login

  def create
    @image = Image.find(params[:image_id])
    @textcomment = @image.textcomments.build(textcomment_params)
    @picturecomment = @image.picturecomments.new

    if @textcomment.save
      current_user.comments.create(content: @textcomment)
      flash[:notice] = "Thanks for commenting!"
      redirect_to @image
    else
      redirect_to :back
    end
  end

  def textcomment_params
    params.require(:textcomment).permit(:body)
  end
end
