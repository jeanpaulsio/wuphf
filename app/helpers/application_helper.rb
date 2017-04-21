module ApplicationHelper
  def twitter_is_connected?
    current_user.twitter_secret_digest && current_user.twitter_token_digest ? true : false
  end
end
