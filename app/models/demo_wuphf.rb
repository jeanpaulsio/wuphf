class DemoWuphf < ApplicationRecord
  before_save :downcase_email
  after_save :send_email, :send_text, :send_tweet

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :message, presence: true, length: { maximum: 140 }
  validates :email,   presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }

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
