class StudentsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_student


  def show
    @user = current_user
  end

end
