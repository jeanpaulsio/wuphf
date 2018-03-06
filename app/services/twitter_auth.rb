class TwitterAuth
  def consumer
    OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], :site => "https://twitter.com")
  end

  def request_token(consumer, hsh)
    OAuth::RequestToken.from_hash(consumer, hsh)
  end

  def callback_url
    return "http://localhost:3000/dashboard/twitter_enabled" if Rails.env.development?
    return "https://wuphfwuphf.herokuapp.com/dashboard/twitter_enabled" if Rails.env.production?
  end
end
