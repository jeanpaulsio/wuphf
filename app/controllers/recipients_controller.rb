class RecipientsController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipient = current_user.recipients.build
  end

  def edit
    @recipient = Recipient.find(params[:id])
  end

  def update
    @recipient = Recipient.find(params[:id])
    if @recipient.update_attributes(recipient_params)
      flash[:success] = "WUPHF! Changes Saved!"
      redirect_to dashboard_path
    else
      flash[:notice] = "Congrats, ya Wuphf'd yourself."
      redirect_to dashboard_path
    end
  end

  def create
    @recipient = current_user.recipients.build(recipient_params)

    if @recipient.save
      flash[:success] = "WUPHF! #{@recipient.name} added to your Dog Pack!"
      redirect_to dashboard_path
    else
      flash[:notice] = "Congrats, ya Wuphf'd yourself."
      redirect_to dashboard_path
    end
  end

  def destroy
    Recipient.find(params[:id]).destroy
    flash[:success] = "WUPHF! Removed from Dog Pack!"
    redirect_to dashboard_path
  end

  private
    def recipient_params
      params.require(:recipient).permit(:name, :email, :phone, :twitter_handle, :facebook_id, :user_id)
    end
end
