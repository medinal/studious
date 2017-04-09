class HomeController < ApplicationController

  before_action :disable_sidebar, only: [:index]

  def index
  end

  private

  def disable_sidebar
    @disable_sidebar = true
  end

end
