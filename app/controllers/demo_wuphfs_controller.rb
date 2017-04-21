class DemoWuphfsController < ApplicationController
  def index
    redirect_to new_demo_wuphf_path
  end

  def show
    redirect_to new_demo_wuphf_path
  end

  def new
    redirect_to dashboard_path if user_signed_in?

    @demo_wuphf = DemoWuphf.new
  end

  def create
    @demo_wuphf = DemoWuphf.new(demo_wuphf_params)

    if @demo_wuphf.save
      SendDemoWuphf.new(@demo_wuphf).execute

      flash[:success] = "WUPHF WUPHF! YOU JUST DEMO'D WUPHF!"
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
