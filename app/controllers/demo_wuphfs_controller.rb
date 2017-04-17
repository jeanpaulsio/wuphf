class DemoWuphfsController < ApplicationController
  def index
    # twitter       = TwitterWrapper.new
    # request_token = twitter.consumer.get_request_token(:oauth_callback => twitter.callback_url)

    # session[:token]        = request_token.token
    # session[:token_secret] = request_token.secret
    # redirect_to request_token.authorize_url(:oauth_callback => twitter.callback_url)
  end

  def show
    # twitter = TwitterWrapper.new

    # hash = { oauth_token: session[:token], oauth_token_secret: session[:token_secret]}
    # request_token = twitter.request_token(twitter.consumer, hash)
    # access_token  = request_token.get_access_token oauth_verifier: params[:oauth_verifier]

    # @client = Twitter::REST::Client.new do |config|
    #   config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
    #   config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    #   config.access_token        = access_token.token
    #   config.access_token_secret = access_token.secret
    # end
  end

  def new
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
