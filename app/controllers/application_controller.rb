class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :is_a_user

  private

  def is_a_student
    if !current_user.student?
      redirect_to root_path
    end
  end

  def is_a_processor
    if !(current_user.processor? || current_user.admin?)
      redirect_to root_path
    end
  end

  def is_an_admin
    if !current_user.admin?
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.student?
      student_path
    elsif resource.processor?
      processor_path
    elsif resource.admin?
      admins_path
    elsif resource.superuser?
      rails_admin_path
    end
  end

  def is_a_user
    if !current_user
      @home = true
    end
  end

end
