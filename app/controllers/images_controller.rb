class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def index
    if params[:image] && params[:image][:name]
      @images = Image.where("name ILIKE ?", "%#{params[:images][:name]}%")

    else
      @images = Image.all
    end

    respond_to do |format|
      format.html  
      format.json { render json: @images }
      format.xml { render xml: @images }
    end
  end

  def new
    @image = Image.new
  end

  def show
    find_by_name
    @comment = Comment.new

    respond_to do |format|
      format.html  
      format.json { render json: @images }
      format.xml { render xml: @images }
    end
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
      redirect_to dashboard_index_path
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
