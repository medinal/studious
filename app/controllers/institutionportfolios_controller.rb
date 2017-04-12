class InstitutionportfoliosController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_processor, except: [:new, :create, :destroy, :autocomplete_institution_name]
  before_action :is_a_student, only: [:destroy, :new, :create, :autocomplete_institution_name]

  before_action :set_institutionportfolio, only: [:show, :edit, :update, :destroy]
  before_action :set_portfolio, only: [:new, :create, :destroy]

  autocomplete :institution, :name, :extra_data => [:id, :status], :display_value => :only_registered


  def index
    if params[:filter] && params[:filter] != "all"
      @portfolios = current_user.institutionportfolios.where(status: params[:filter]).paginate(page: params[:page], per_page: 7)
      @filter = params[:filter]
    else
      @portfolios = current_user.institutionportfolios.paginate(page: params[:page], per_page: 7)
    end
  end


  def new
    @institutionportfolios = current_user.institutionportfolios
    @institutionportfolio = Institutionportfolio.new
  end


  def show
  end


  def create
    @portfolio = Portfolio.find_by slug: params[:portfolio_id]
    @institutionportfolio = Institutionportfolio.new(institutionportfolio_params)
    @institutionportfolio.portfolio = @portfolio
    if @institutionportfolio.save
      @portfolio.submitted!
      redirect_to share_path(@portfolio), notice: 'Portfolio was successfully shared.'
    else
      render @portfolio
    end
  end


  def edit
  end


  def update
    if @institutionportfolio.update(institutionportfolio_params)
      redirect_to processor_institutionportfolios_path, notice: 'Portfolio was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @portfolio = @institutionportfolio.portfolio
    @institutionportfolio.destroy
    if @portfolio.institutionportfolios.length == 0
      @portfolio.draft!
    end
    redirect_to share_path(@portfolio), notice: 'Portfolio has been retracted.'
  end


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
