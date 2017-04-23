class Message < ApplicationRecord
  belongs_to :user
  belongs_to :recipient

  delegate :name, :email, :phone, :twitter_handle, to: :recipient, prefix: true
  delegate :name, to: :user, prefix: true

  validates :content, presence: true, length: { maximum: 140 }
end
