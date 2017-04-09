class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student, except: [:show]

  def show
    if params[:user_id]
      @user = User.find_by identifier: params[:user_id]
      if @user
        @profile = @user.profile
      else
        raise ActionController::RoutingError.new('Not Found')
      end
    else
      @user = current_user
      @profile = current_user.profile
    end
  end

  def new
    if current_user.profile
      redirect_to student_profile_path
    else
      @profile = Profile.new
    end
  end

  def create
    current_user.create_profile(profile_params)
    redirect_to student_profile_path
  end

  def edit
    @profile = current_user.profile
  end

  def update
    profile = current_user.profile
    profile.update_attributes(profile_params)
    redirect_to student_profile_path
  end

  private

  def profile_params
    params.require(:profile).permit(:about_me, :zip, :bio, :goals, :interests, :born_on, :avatar)
  end

end
