class SessionStrategy::UserSession
  attr_accessor :adapter, :class_name

  def initialize(adapter)
    class_name = "SessionStrategy::#{adapter.capitalize}"
    @adapter= class_name.constantize
  end

  def from_omniauth(auth)
    @adapter.from_omniauth(auth)
  end
end
