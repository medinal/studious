class InstitutionportfoliosController < ApplicationController

  before_action :set_institutionportfolio, only: [:show, :edit, :update]

  # GET /institutionportfolios
  def index
    @portfolios = current_user.institutionportfolios
  end

  def new
  end

  # GET /institutionportfolios/1
  def show
  end

  def create
  end

  # GET /institutionportfolios/1/edit
  def edit
  end

  # PATCH/PUT /institutionportfolios/1
  def update
    if @institutionportfolio.update(institutionportfolio_params)
      redirect_to processor_institutionportfolio_path(@institutionportfolio), notice: 'Institutionportfolio was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_institutionportfolio
      @institutionportfolio = Institutionportfolio.find(params[:id])
    end

    def institutionportfolio_params
      params.require(:institutionportfolio).permit(:comments, :status)
    end
end
