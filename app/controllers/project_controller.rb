class ProjectController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student


  private

  def project_params
    params.require(:project).permit(:title, :description, :reflection, :date, :status)
  end

end
