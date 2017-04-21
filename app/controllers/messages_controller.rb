class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      flash[:success] = "YOU WUPHF'D: #{Recipient.find(@message.recipient_id).name}"
      redirect_to dashboard_path
    else
      flash[:notice] = "Congrats, ya Wuphf'd yourself."
      redirect_to dashboard_path
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :user_id, :recipient_id)
    end
end
