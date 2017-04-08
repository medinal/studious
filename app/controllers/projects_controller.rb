class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @user = User.find(params[:id])
      if @user
        @projects = @user.projects
      else
        raise ActionController::RoutingError.new('Not Found')
      end
    else
      @projects = current_user.projects
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    @project.user = current_user
    @project.save
    redirect_to student_project_path(@project)
  end

  def edit
    @project = Project.find(params[:id])
  end


  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    redirect_to student_project_path(@project)
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
      params.require(:project).permit(:title, :description, :reflection, :date, :status)
    end

end
