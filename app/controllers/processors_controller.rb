class ProcessorsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_a_processor
  before_action :set_quote

  def show
    @user = current_user
  end

end
