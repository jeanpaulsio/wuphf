class DemoWuphf < ApplicationRecord
  before_save :downcase_email

  VALID_EMAIL_REGEX  = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/

  validates :from,           presence: true, length: { maximum: 20 }
  validates :to,             presence: true, length: { maximum: 20 }
  validates :message,        presence: true, length: { maximum: 140 }
  validates :email,          presence: true, length: { maximum: 255 },
                             format: { with: VALID_EMAIL_REGEX }
  validates :phone,          presence: true,
                             format: { with: VALID_PHONE_REGEX }
  validates :twitter_handle, presence: true, length: { maximum: 15 }

  private
    def downcase_email
      self.email = email.downcase
    end
end
