class InstitutionportfoliosController < ApplicationController

  autocomplete :institution, :name, :extra_data => [:id, :status], :display_value => :only_registered

  before_action :set_institutionportfolio, only: [:show, :edit, :update, :destroy]
  before_action :set_portfolio, only: [:new, :create, :destroy]

  # GET /institutionportfolios
  def index
    @portfolios = current_user.institutionportfolios
  end

  def new
    @institutionportfolios = current_user.institutionportfolios
    @institutionportfolio = Institutionportfolio.new
  end

  # GET /institutionportfolios/1
  def show
  end

  def create
    @portfolio = Portfolio.find_by slug: params[:portfolio_id]
    @institutionportfolio = Institutionportfolio.new(institutionportfolio_params)
    @institutionportfolio.portfolio = @portfolio
    if @institutionportfolio.save
      redirect_to share_path(@portfolio), notice: 'Portfolio was successfully shared.'
    else
      render @portfolio
    end
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

  def destroy
    @portfolio = @institutionportfolio.portfolio
    @institutionportfolio.destroy
    redirect_to share_path(@portfolio), notice: 'Portfolio has been retracted.'
  end

  #This form allows the autocomplete search to just search for registered institutions.
  def autocomplete_institution_name
    term = params[:term]
    institutions = Institution.where('status = 2').where('name LIKE ?', "%#{term}%").order(:name).all
    render :json => institutions.map { |institution| {:id => institution.id, :name => institution.name, :value => institution.name} }
  end

  private
    def set_institutionportfolio
      @institutionportfolio = Institutionportfolio.find(params[:id])
    end

    def institutionportfolio_params
      params.require(:institutionportfolio).permit(:comments, :status, :institution_id)
    end

    def set_portfolio
      @portfolio = Portfolio.find_by slug: params[:portfolio_id]
    end

end
