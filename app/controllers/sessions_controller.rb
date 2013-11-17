class SessionsController < ApplicationController
  def create
      user = User.from_omniauth(params[:provider], env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to venue_path
  end

  def destroy
      session[:user_id] = nil
      redirect_to root_url
  end
end
