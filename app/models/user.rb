class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages, :dependent => :destroy
  has_many :recipients, :dependent => :destroy

  def twitter_authorized?
    return true if self.twitter_token_digest && self.twitter_secret_digest
  end
end


