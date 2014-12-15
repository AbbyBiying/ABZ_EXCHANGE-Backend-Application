class ImagesController < ApplicationController
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def show
    find_image
    @text_comment = TextComment.new
    @picture_comment = PictureComment.new
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to @image
    else
      render :new
    end
  end

  def edit
    find_image
  end

  def update
    find_image
    if @image.update(image_params)
      redirect_to @image
    else
      render :edit
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to root_path
  end

  private

  def require_permission
    if current_user != Image.find(params[:id]).user
      flash[:error] = "You do not have the right to do it."
      redirect_to dashboard_path
    end
  end

  def find_image
    @image ||= Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(
      :comment,
      :description,
      :name,
      :url,
      :user_id
      )
  end
end
