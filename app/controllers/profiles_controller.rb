class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:about_me, :zip, :bio, :goals, :interests, :born_on, :avatar)
  end

end
