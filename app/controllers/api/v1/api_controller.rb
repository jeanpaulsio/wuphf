class Api::V1::ApiController < ApplicationController
  include Response
  include ExceptionHandler

  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_api_v1_user!
end
