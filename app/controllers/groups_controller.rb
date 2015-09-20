class GroupsController < ApplicationController
  before_action :require_login, except: [:index]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    find_group
    @comment = Comment.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  def edit
    find_group
  end

  def update
    find_group
    if @group.update(group_params)
      redirect_to @group
    else
      render :edit
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to root_path
  end

  private

  def require_permission
    if current_user != Group.find(params[:id]).user
      flash[:error] = "You do not have the right to do it."
      redirect_to dashboard_path
    end
  end

  def find_group
    @group ||= Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(
      :comment,
      :description,
      :name,
      :user_id
      )
  end
end
