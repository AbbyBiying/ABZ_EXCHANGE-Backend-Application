class ImagesController < ApplicationController
  before_action :require_login, except: [:index]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def show
    find_by_name
    @comment = Comment.new
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      flash[:notice] = "Image was successfully created!"
      redirect_to @image
    else
      render :new
    end
  end

  def edit
    find_by_name
  end

  def update
    find_by_name
    if @image.update(image_params)
      flash[:notice] = "Image was successfully updated!"
      redirect_to @image
    else
      render :edit
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    flash[:notice] = "Image was successfully deleted!"
    redirect_to root_path
  end

  private

  def require_permission
    if current_user != Image.find(params[:id]).user
      flash[:error] = "You do not have the permission to do it."
      redirect_to dashboard_path
    end
  end

  def find_by_name
    @image ||= Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(
      :avatar,
      :comment,
      :description,
      :name,
      :url,
      :user_id
      )
  end
end
