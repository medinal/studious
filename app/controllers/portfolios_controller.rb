class PortfoliosController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :is_a_student, except: [:show]
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy, :share, :submit]


    def index
      @portfolios = current_user.portfolios
    end


    def show
    end


    def new
      @portfolio = Portfolio.new
      @portfolio.portfolioprojects.build
    end


    def edit
    end


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


    def update
      if @portfolio.update(portfolio_params)
        redirect_to @portfolio, notice: 'Portfolio was successfully updated.'
      else
        render :edit
      end
    end


    def destroy
      @portfolio.destroy
      redirect_to student_portfolios_path, notice: 'Portfolio was successfully destroyed.'
    end


  private


    def set_portfolio
      @portfolio = Portfolio.find_by slug: params[:portfolio_id]
    end


    def portfolio_params
      params.require(:portfolio).permit(:title, :welcome_message, :project_ids => [])
    end

end
