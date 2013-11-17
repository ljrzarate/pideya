class HomeController < ApplicationController
  layout "application"
  before_filter :logged_in

  def index
  end
end
