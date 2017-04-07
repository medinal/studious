class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  private

  def is_a_student
    if !current_user.student?
      redirect_to root_path
    end
  end

end
