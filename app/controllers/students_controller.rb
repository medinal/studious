class StudentsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student


  def show
    @user = current_user
    @quote = Quote.order("RANDOM()").first
  end

  def submit
    if !current_user.identifier
      current_user.make_identifier
    end
  end

  def student_params
    params.require(:user).permit(:about_me, :zip, :bio, :goals, :interests, :born_on, :avatar)
  end

end
