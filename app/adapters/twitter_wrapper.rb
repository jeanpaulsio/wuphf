class TwitterWrapper
  attr_accessor :twitter_handle, :message, :client

  def initialize(token=ENV['TWITTER_ACCESS_TOKEN'], secret=ENV['TWITTER_ACCESS_TOKEN_SECRET'])
    boot_twitter(token, secret)
  end

  def tweet
    @client.update("@#{twitter_handle} #{message}")
  end

  private

    def boot_twitter(token, secret)
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = token
        config.access_token_secret = secret
      end
    end
end

