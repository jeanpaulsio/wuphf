class DemoWuphfsController < ApplicationController
  def new
    @demo_wuphf = DemoWuphf.new
  end

  def create
    @demo_wuphf = DemoWuphf.new(demo_wuphf_params)

    if @demo_wuphf.save
      WuphfMailer.wuphf_mail(@demo_wuphf).deliver_now
      TextMessage.new(@demo_wuphf).send
      $twitter.update("@" + @demo_wuphf.twitter_handle + " " + @demo_wuphf.message)
      flash[:success] = "WUPHF WUPHF!"
      redirect_to new_demo_wuphf_path
    else
      render 'new'
    end
  end

  private
    def demo_wuphf_params
      params.require(:demo_wuphf).permit(:message, :email, :phone, :twitter_handle)
    end
end
