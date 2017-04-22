class User < ApplicationRecord
  before_save :capitalize_name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
end


