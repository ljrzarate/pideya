class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_user
    redirect_to root_path unless current_user
  end

  def logged_in
  	redirect_to venues_path if current_user
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
