class Api::V1::RecipientsController < Api::V1::ApiController
  respond_to :json
  before_action :set_user
  before_action :set_recipient, only: [:show, :update, :destroy]

  # GET api/v1/recipients
  def index
    @recipients = @user.recipients
    json_response(@recipients)
  end

  # POST api/v1/recipients
  def create
    @recipient = @user.recipients.create!(recipient_params)
    json_response(@recipient, :created)
  end

  # GET api/v1/recipients/:id
  def show
    json_response(@recipient)
  end

  # PUT api/v1/recipients/:id
  def update
    @recipient.update(recipient_params)
    head :no_content
  end

  #DELETE api/v1/recipients/:id
  def destroy
    @recipient.destroy
    head :no_content
  end

  private

    def recipient_params
      params.permit(:name, :email, :phone, :twitter_handle, :facebook_id, :user_id)
    end

    def set_recipient
      @recipient = current_user.recipients.find_by(id: params[:id])
    end

    def set_user
      @user = current_user
    end
end
