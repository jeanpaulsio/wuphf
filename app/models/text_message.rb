class TextMessage
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :message, :phone

  def initialize(options = {})
    @message = options.message
    @phone   = options.phone
    @from    = options.from
    boot_twilio
  end

  def send
    message = @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: @phone,
      body: "WUPHF FROM #{@from.upcase}: " + @message
    )
  end

  private

    def boot_twilio
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']
      @client = Twilio::REST::Client.new account_sid, auth_token
    end

end
