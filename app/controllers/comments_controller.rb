class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def create
    p current_user.inspect
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment was successfully created!"
      redirect_to @comment.commentable
    else
      redirect_to @comment.commentable
    end
  end

  def update
    find_comment
    if @comment.update(comment_params)
      p @comment.inspect
      flash[:notice] = "Comment was successfully updated!"
      redirect_to @comment.commentable
    else
      p "did not save"
      redirect_to @comment.commentable
    end
  end

  def destroy
    find_comment
    comment.destroy
    flash[:notice] = "Comment was successfully deleted!"

    redirect_to dashboard_index_path
  end

  private

  def require_permission
    if current_user != Comment.find(params[:id]).user
      flash[:error] = "You do not have the permission to do it."
      redirect_to dashboard_index_path
    end
  end

  def find_comment
    @comment ||= Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(
      :avatar,
      :commentable_type,
      :commentable_id,
      :body
      )
  end
end
