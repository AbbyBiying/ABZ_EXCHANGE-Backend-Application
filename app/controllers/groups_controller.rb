class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    find_by_name
    @comment = Comment.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:notice] = "Group was successfully created!"
      redirect_to @group
    else
      render :new
    end
  end

  def edit
    find_by_name
  end

  def update
    find_by_name
    if @group.update(group_params)
      flash[:notice] = "Group was successfully updated!"
      redirect_to @group
    else
      render :edit
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    flash[:notice] = "Group was successfully deleted!"
    redirect_to root_path
  end

  private

  def require_permission
    if current_user != Group.find(params[:id]).user
      flash[:error] = "You do not have the permission to do it."
      redirect_to dashboard_index_path
    end
  end

  def find_by_name
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
