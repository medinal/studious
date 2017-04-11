class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student
  before_action :set_project, only: [:show, :edit, :update, :destroy]


    def index
      @projects = current_user.projects
    end


    def show
      @project = Project.find(params[:id])
    end


    def new
      @project = Project.new
      @project.images.build
    end


    def create
      @project = Project.create(project_params)
      @project.user = current_user
      if @project.save
        redirect_to student_project_path(@project), notice: 'Project was successfully created.'
      else
        render :new
      end
    end


    def edit
      @project = Project.find(params[:id])
    end


    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        delete_image
        redirect_to student_project_path(@project), notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end


    def destroy
      project = Project.find(params[:id])
      project.destroy
      redirect_to student_projects_path
    end


  private


    def set_project
      @project = Project.find(params[:id])
    end


    def project_params
      params.require(:project).permit(:title, :description, :reflection, :date, :status, images_attributes: [:avatar, :remove_avatar, :id])
    end


    def delete_image
      @project.images.each do |image|
        p image
        if image[:avatar] == nil
          image.destroy
        end
      end
    end

end
