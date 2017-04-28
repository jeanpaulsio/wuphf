class Api::V1::MessagesController < Api::V1::ApiController
  # POST api/v1/messages
  def create
    @message = current_user.messages.create!(message_params)
    SendWuphf.new(@message).execute unless @message.nil?
    json_response(@message, :created)
  end

  private
    def message_params
      params.permit(:content, :user_id, :recipient_id)
    end
end
