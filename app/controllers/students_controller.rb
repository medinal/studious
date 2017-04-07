class StudentsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student


  def show
    @user = current_user
  end

  private

  def is_a_student
    if !current_user.student?
      redirect_to root_path
    end
  end

end
