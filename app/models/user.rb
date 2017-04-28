class User < ApplicationRecord
  before_save :capitalize_name

  before_validation :set_provider
  before_validation :set_uid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :messages, :dependent => :destroy
  has_many :recipients, :dependent => :destroy

  validates :name, presence: true, length: { maximum: 20 }

  def twitter_authorized?
    return true if self.twitter_token_digest && self.twitter_secret_digest
  end

  private
    def capitalize_name
      self.name = name.capitalize
    end

    def set_provider
      self[:provider] = "email" if self[:provider].blank?
    end

    def set_uid
      self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
    end
end
