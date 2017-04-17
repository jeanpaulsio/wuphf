class DemoWuphfsController < ApplicationController
  def index
    redirect_to new_demo_wuphf_path
  end

  def new
    @demo_wuphf = DemoWuphf.new
  end

  def create
    @demo_wuphf = DemoWuphf.new(demo_wuphf_params)

    if @demo_wuphf.save
      WuphfMailer.wuphf_mail(@demo_wuphf).deliver_now
      TextMessage.new(@demo_wuphf).send
      Tweet.new(@demo_wuphf).send

      flash[:success] = "WUPHF WUPHF! YOU HAVE SENT A WUPHF!"
      redirect_to new_demo_wuphf_path
    else
      render 'new'
    end
  end

  private
    def demo_wuphf_params
      params.require(:demo_wuphf).permit(:from, :to, :message, :email, :phone, :twitter_handle)
    end
end
