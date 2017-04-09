class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student

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
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to student_profile_path, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    if @profile.update(profile_params)
      redirect_to student_profile_path, notice: 'Profile was successfully updated.'
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:zip, :bio, :goals, :interests, :born_on)
  end

end
