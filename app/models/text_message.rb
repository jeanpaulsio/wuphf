class TextMessage
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :message, :phone

  PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/

  validates :message, presence: true
  validates :phone,   presence: true, format: { with: PHONE_NUMBER_REGEX }

  def initialize(options = {})
    @message = options.message
    @phone   = options.phone
    boot_twilio
  end

  def send
    message = @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: @phone,
      body: @message
    )
  end

  private

  def boot_twilio
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

end
