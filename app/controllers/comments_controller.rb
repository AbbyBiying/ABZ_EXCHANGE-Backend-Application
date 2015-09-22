class CommentsController < ApplicationController
  before_action :require_login, except: [:index]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def create
    p current_user.inspect
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to @comment.commentable
    else
      redirect_to @comment.commentable
    end
  end

  def edit
    find_comment
  end

  def update
    find_comment
    if @comment.update(comment_params)
      redirect_to @comment.commentable
    else
      redirect_to @comment.commentable
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to root_path
  end

  private

  def require_permission
    if current_user != Comment.find(params[:id]).user
      flash[:error] = "You do not have the right to do it."
      redirect_to dashboard_path
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
