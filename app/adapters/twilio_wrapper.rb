class TwilioWrapper
  attr_accessor :message, :phone, :from

  def initialize
    boot_twilio
  end

  def send_sms
    @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: @phone,
      body: "#{@from.upcase} WUPHF'D: " + @message
    )
  end

  private

    def boot_twilio
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']
      @client = Twilio::REST::Client.new account_sid, auth_token
    end
end
