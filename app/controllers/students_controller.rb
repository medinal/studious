class StudentsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student
  before_action :set_quote

    def show
      @user = current_user
    end


  private


    def student_params
      params.require(:user).permit(:zip, :bio, :goals, :interests, :born_on, :avatar)
    end

end
