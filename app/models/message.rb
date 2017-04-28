class Message < ApplicationRecord
  belongs_to :user
  belongs_to :recipient

  delegate :name, :email, :phone, :twitter_handle, to: :recipient, prefix: true
  delegate :name, to: :user, prefix: true

  validates :content, presence: true, length: { maximum: 140 }

  validate :validate_recipient_id

  private

    def validate_recipient_id
      current_user = User.find(self.user_id)
      recipient    = current_user.recipients.find(self.recipient_id)

      if recipient.nil?
        errors.add(:recipient_id, 'Invalid Recipient ID')
      end
    end
end
