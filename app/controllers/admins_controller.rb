class AdminsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_an_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = current_user.institution.users
  end

  def show
    if !current_user.institution.users.include?(@user)
      redirect_to admins_path
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if !current_user.institution.users.include?(@user)
      redirect_to users_path
    end
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_path(@user), notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
  
    respond_to do |format|
      if @user.save
        format.html { redirect_to admins_path, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to admins_path, notice: 'User was successfully destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :institution_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
