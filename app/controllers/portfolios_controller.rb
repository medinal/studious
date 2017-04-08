class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :update, :destroy, :submit]

  # GET /portfolios
  def index
    @portfolios = current_user.portfolios
  end

  # GET /portfolios/1
  def show
    if params[:portfolio_id]
      @portfolio = Portfolio.find_by identifier: params[:portfolio_id]
    else
      @portfolio = Portfolio.find(params[:id])
    end
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user_id = current_user.id
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
    redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.'
  end

  def submit
    if !@portfolio.identifier
      @portfolio.make_identifier
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_params
      params.require(:portfolio).permit(:user_id)
    end
end
