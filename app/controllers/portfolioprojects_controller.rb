class PortfolioprojectsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student

  def create

  end

  private

  def portfolioproject_params
    params.require(:portfolioproject).permit(:id, :project_id)
  end

end
