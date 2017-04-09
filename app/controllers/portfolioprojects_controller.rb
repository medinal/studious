class PortfolioprojectsController < ApplicationController

  def create

  end

  private

  def portfolioproject_params
    params.require(:portfolioproject).permit(:id, :project_id)
  end

end
