class TwitterAuth
  def consumer
    OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], :site => "https://twitter.com")
  end

  def request_token(consumer, hsh)
    OAuth::RequestToken.from_hash(consumer, hsh)
  end

  def callback_url
    "http://localhost:3000/dashboard/twitter_enabled"
  end
end
