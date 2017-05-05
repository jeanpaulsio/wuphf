class Users::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def sign_up_params
    params.require(:registration).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:registration).permit(:name, :email, :twitter_token_digest, :twitter_secret_digest)
  end
end
