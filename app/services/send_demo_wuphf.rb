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
    TwilioWrapper.new(@demo_wuphf).send
  end

  def send_tweet
    TwitterWrapper.new(@demo_wuphf).send
  end
end
