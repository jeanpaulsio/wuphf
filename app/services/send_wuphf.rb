class SendWuphf
  def initialize(message)
    @current_user = User.find(message.user.id)
    @wuphf = {
      phone: message.recipient.phone,
      email: message.recipient.email,
      twitter_handle: message.recipient.twitter_handle,
      from: message.user.name,
      message: message.content
    }
  end

  def execute
    send_email
    send_text
    send_tweet
  end

  def send_email
    WuphfMailer.wuphf_mail(@wuphf).deliver_now
  end

  def send_text
    twilio = TwilioWrapper.new
    twilio.message = @wuphf[:message]
    twilio.phone   = @wuphf[:phone]
    twilio.from    = @wuphf[:from]
    twilio.send_sms
  end

  def send_tweet
    token  = @current_user.twitter_token_digest
    secret = @current_user.twitter_secret_digest

    twitter = TwitterWrapper.new(token, secret)
    twitter.message        = @wuphf[:message]
    twitter.twitter_handle = @wuphf[:twitter_handle]
    twitter.tweet
  end
end
