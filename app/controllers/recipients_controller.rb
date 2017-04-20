class RecipientsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipient = current_user.recipients.build(recipient_params)

    if @recipient.save
      flash[:success] = "WUPHF! #{@recipient.name} added to your dogpack!"
      redirect_to dashboard_path
    else
      flash[:danger] = "Congrats, ya Wuphf'd yourself."
      redirect_to dashboard_path
    end
  end

  private
    def recipient_params
      params.require(:recipient).permit(:name, :email, :phone, :twitter_handle, :facebook_id, :user_id)
    end
end
