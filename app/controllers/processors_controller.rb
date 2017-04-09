class ProcessorsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_processor

  def show
    @user = current_user
  end

end
