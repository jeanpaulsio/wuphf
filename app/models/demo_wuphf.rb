class DemoWuphf < ApplicationRecord
  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :message, presence: true, length: { maximum: 140 }
  validates :email,   presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }

  private
    def downcase_email
      self.email = email.downcase
    end
end
