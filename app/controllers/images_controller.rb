class ImagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def new
    @image = Image.new
  end


  def edit
  end


  def create
    if params[:project_id]
      @imageable = Project.find(params[:project_id])
      @image = @imageable.images.build(image_params)
    else
      @imageable = current_user
      @image = @imageable.build_image(image_params)
    end
    if @image.save
      redirect, notice: 'Image was successfully saved.'
    else
      render :new
    end
  end


  def update
    if @image.update(image_params)
      redirect, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @image.destroy
    redirect, notice: 'Image was successfully removed.'
  end

  private

    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:avatar, :project_id, :id, :remove_avatar)
    end

end
