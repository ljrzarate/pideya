class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid, :image

  def self.from_omniauth(provider, auth)
    user_session = SessionStrategy::UserSession.new provider
    user_session.from_omniauth auth
  end
end
