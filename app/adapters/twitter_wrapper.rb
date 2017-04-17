class TwitterWrapper
  def initialize(options = {})
    @twitter_handle = options.twitter_handle
    @message        = options.message

    boot_twitter
  end

  def send
    @client.update("@" + @twitter_handle + " " + @message)
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
