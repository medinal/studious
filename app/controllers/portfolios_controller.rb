class PortfoliosController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :is_a_student, except: [:show]
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy, :share, :submit]

  # GET /portfolios
  def index
    @portfolios = current_user.portfolios
  end

  # GET /portfolios/1
  def show
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
    @portfolio.portfolioprojects.build
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user_id = current_user.id
    @portfolio.make_identifier
    if @portfolio.save
      redirect_to @portfolio, notice: 'Portfolio was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /portfolios/1
  def update
    if @portfolio.update(portfolio_params)
      redirect_to @portfolio, notice: 'Portfolio was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /portfolios/1
  def destroy
    @portfolio.destroy
    redirect_to student_portfolios_path, notice: 'Portfolio was successfully destroyed.'
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find_by slug: params[:portfolio_id]
  end

  # Only allow a trusted parameter "white list" through.
  def portfolio_params
    params.require(:portfolio).permit(:title, :welcome_message, :project_ids => [])
  end

end
