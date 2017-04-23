class Recipient < ApplicationRecord
  before_save :downcase_email

  belongs_to :user
  has_many :messages, :dependent => :destroy

  VALID_EMAIL_REGEX  = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/


  validates :name,           presence: true, length: { maximum: 25 }
  validates :email,          presence: true, length: { maximum: 255 },
                             format: { with: VALID_EMAIL_REGEX }
  validates :phone,          presence: true,
                             format: { with: VALID_PHONE_REGEX }
  validates :twitter_handle, length: { maximum: 15 }

  delegate :name, to: :user, prefix: true

  private
    def downcase_email
      self.email = email.downcase
    end
end
