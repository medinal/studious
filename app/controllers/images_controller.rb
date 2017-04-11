class ImagesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  def create
    if params[:project_id]
      @imageable = Project.find(params[:project_id])
      @image = @imageable.images.build(image_params)
    else
      @imageable = current_user
      @image = @imageable.build_image(image_params)
    end
    if @image.save
      redirect_to student_path, notice: "Image was successfully added."
    else
      render :new
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      redirect_to student_path, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    redirect_to student_path, notice: 'Image was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:avatar, :project_id, :id, :remove_avatar)
    end

end
