class DemoWuphf < ApplicationRecord
  before_save :downcase_email
  after_save :send_email,
             :send_text,
             :send_tweet

  VALID_EMAIL_REGEX  = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/

  validates :from,           presence: true, length: { maximum: 20 }
  validates :to,             presence: true, length: { maximum: 20 }
  validates :message,        presence: true, length: { maximum: 123 }
  validates :email,          presence: true, length: { maximum: 255 },
                             format: { with: VALID_EMAIL_REGEX }
  validates :phone,          presence: true,
                             format: { with: VALID_PHONE_REGEX }
  validates :twitter_handle, presence: true, length: { maximum: 15 }

  private
    def downcase_email
      self.email = email.downcase
    end

    def send_email
      WuphfMailer.wuphf_mail(self).deliver_now
    end

    def send_text
      TextMessage.new(self).send
    end

    def send_tweet
      Tweet.new(self).send
    end
end
