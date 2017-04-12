class Tweet
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def initialize(options = {})
    @twitter_handle = options.twitter_handle
    @message        = options.message
  end

  def send
    $twitter.update("@" + @twitter_handle + " " + @message)
  end
end
