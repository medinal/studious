class ProjectController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student, except: [:index, :show]


  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :reflection, :date, :status)
  end

end
