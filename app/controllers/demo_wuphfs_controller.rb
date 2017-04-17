class DemoWuphfsController < ApplicationController
  def index
    @callback_url = "http://localhost:3000/demo_wuphfs/show"
    @consumer     = OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], :site => "https://twitter.com")
    @request_token = @consumer.get_request_token(:oauth_callback => @callback_url)

    session[:token] = @request_token.token
    session[:token_secret] = @request_token.secret
    redirect_to @request_token.authorize_url(:oauth_callback => @callback_url)
  end

  def show
    @consumer = OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], :site => "https://twitter.com")

    hash = { oauth_token: session[:token], oauth_token_secret: session[:token_secret]}
    request_token  = OAuth::RequestToken.from_hash(@consumer, hash)
    @access_token = request_token.get_access_token oauth_verifier: params[:oauth_verifier]

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = @access_token.token
      config.access_token_secret = @access_token.secret
    end
  end

  def new
    @demo_wuphf = DemoWuphf.new
  end

  def create
    @demo_wuphf = DemoWuphf.new(demo_wuphf_params)

    if @demo_wuphf.save
      SendDemoWuphf.new(@demo_wuphf).execute

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
