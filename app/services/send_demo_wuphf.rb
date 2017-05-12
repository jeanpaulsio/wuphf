class SendDemoWuphf
  def initialize(demo_wuphf)
    @demo_wuphf = demo_wuphf
  end

  def execute
    send_email
    send_text
    send_tweet
  end

  def send_email
    WuphfMailer.wuphf_mail(@demo_wuphf).deliver_now
  end

  def send_text
    twilio = TwilioWrapper.new
    twilio.message = @demo_wuphf.message
    twilio.phone   = @demo_wuphf.phone
    twilio.from    = @demo_wuphf.from
    twilio.send_sms
  end

  def send_tweet
    return if no_recipient_twitter

    twitter = TwitterWrapper.new
    twitter.message        = @demo_wuphf.message
    twitter.twitter_handle = @demo_wuphf.twitter_handle
    twitter.tweet
  end

  def no_recipient_twitter
    @demo_wuphf[:twitter_handle].empty?
  end
end
