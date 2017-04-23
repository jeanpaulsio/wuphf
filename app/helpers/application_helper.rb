module ApplicationHelper
  def twitter_is_connected?
    current_user.twitter_secret_digest && current_user.twitter_token_digest ? true : false
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
end
