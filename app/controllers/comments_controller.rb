class CommentsController < ApplicationController
  before_action :require_login

  def new
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build(comment_params)
    if @comment.save
      redirect_to @image
    else
      redirect_to :back
    end
  end

  def destroy
    @image = Image.find(params[:image_id])
    @image.comments.destroy(comment)
    redirect_to root_path
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end

