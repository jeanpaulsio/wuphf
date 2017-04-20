class RecipientsController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @recipient = Recipient.all
  end
end
