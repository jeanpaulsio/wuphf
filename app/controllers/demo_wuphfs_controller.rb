class DemoWuphfsController < ApplicationController
  def new
    @demo_wuphf = DemoWuphf.new
  end

  def create
    @demo_wuphf = DemoWuphf.new(demo_wuphf_params)
    if @demo_wuphf.save
      WuphfMailer.wuphf_mail(@demo_wuphf).deliver_now
      flash[:success] = "Wuphf Wuphf"
      redirect_to new_demo_wuphf_path
    else
      render 'new'
    end
  end

  private
    def demo_wuphf_params
      params.require(:demo_wuphf).permit(:message, :email)
    end
end
