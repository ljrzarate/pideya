class SessionStrategy::Twitter
  def self.from_omniauth(auth)
    User.where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end
end
