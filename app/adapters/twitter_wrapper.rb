class TwitterWrapper
  attr_accessor :twitter_handle, :message

  def initialize
    boot_twitter
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

