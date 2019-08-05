class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def index
    if params[:group] && params[:group][:name]
      @groups = Group.where("name ILIKE ?", "%#{params[:group][:name]}%")

    else
      @groups = Group.all
    end
    
    respond_to do |format|
      format.html  
      format.json { render json: @groups }
      format.xml { render xml: @groups }
    end
  end

  def new
    @group = Group.new
  end

  def show
    find_by_name
    @comment = Comment.new
    respond_to do |format|
      format.html  
      format.json { render json: @group }
      format.xml { render xml: @group }
    end
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:notice] = "Group was successfully created!"

      respond_to do |format|
        format.html { redirect_to @group }

        format.json { render json: @group }
        format.xml { render xml: @group }
      end
    else
      respond_to do |format|
        format.html { render :new }

        format.json { render json: @group }
        format.xml { render xml: @group }
      end
    end
  end

  def edit
    find_by_name
  end

  def update
    find_by_name
    if @group.update(group_params)
      flash[:notice] = "Group was successfully updated!"
      respond_to do |format|
        format.html { redirect_to @group }

        format.json { render json: @group }
        format.xml { render xml: @group }
      end
    else
      respond_to do |format|
        format.html { render :edit }

        format.json { render json: @group }
        format.xml { render xml: @group }
      end
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    flash[:notice] = "Group was successfully deleted!"    
    respond_to do |format|
      format.html { redirect_to root_path }

      format.json { redirect_to root_path }
      format.xml { redirect_to root_path }
    end
  end

  private

  def require_permission
    find_by_name

    if current_user != @group.user
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
