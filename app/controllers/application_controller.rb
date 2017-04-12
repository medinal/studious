class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :is_a_user

  def redirect
    if !current_user
      redirect_to root_path
    elsif current_user.student?
      redirect_to student_path
    elsif current_user.processor?
      redirect_to processor_path
    elsif current_user.admin?
      redirect_to admins_path
    elsif current_user.superuser?
      redirect_to rails_admin_path
    end
  end

  private

  def set_quote
    @quote = Quote.order("RANDOM()").first
  end

  def is_a_student
    if !current_user.student?
      redirect_to redirect_path
    end
  end

  def is_a_processor
    if !(current_user.processor? || current_user.admin?)
      redirect_to redirect_path
    end
  end

  def is_an_admin
    if !current_user.admin?
      redirect_to redirect_path
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
