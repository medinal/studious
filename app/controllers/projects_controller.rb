class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end


  def destroy
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :reflection, :date, :status)
    end

end
