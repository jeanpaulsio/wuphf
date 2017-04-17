class TwitterWrapper
  attr_accessor :twitter_handle, :message

  def initialize
    boot_twitter
  end

  def consumer
    OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], :site => "https://twitter.com")
  end

  def request_token(consumer, hsh)
    OAuth::RequestToken.from_hash(consumer, hsh)
  end

  def callback_url
    "http://localhost:3000/demo_wuphfs/show"
  end

  def tweet
    @client.update(message)
  end

  private

    def boot_twitter
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
    end
end

