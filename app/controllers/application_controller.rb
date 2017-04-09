class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :is_a_user

  private

  def is_a_student
    if !current_user.student?
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
    student_path
  end

  def is_a_user
    if !current_user
      @home = true
    end
  end

end
