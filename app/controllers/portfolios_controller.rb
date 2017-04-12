class PortfoliosController < ApplicationController

  before_action :authenticate_user!, except: [:showpublic]
  before_action :is_a_student, except: [:showpublic]
  before_action :set_portfolio, only: [:show, :showpublic, :edit, :update, :destroy, :share, :submit]


    def index
      if params[:filter] && params[:filter] != "all"
        @portfolios = current_user.portfolios.where(status: params[:filter]).paginate(page: params[:page], per_page: 7)
        @filter = params[:filter]
      else
        @portfolios = current_user.portfolios.paginate(page: params[:page], per_page: 7)
      end
    end


    def show
    end

    def showpublic
    end


    def new
      if current_user.profile
        @portfolio = Portfolio.new
        @portfolio.portfolioprojects.build
      else
        redirect_to new_student_profile_path, notice: "You must make a profile before creating your portfolio"
      end
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
