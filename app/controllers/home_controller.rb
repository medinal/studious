class HomeController < ApplicationController

  before_action :home, only: [:index]

  def index
  end

  private

  def home
    @home = true
  end

end
