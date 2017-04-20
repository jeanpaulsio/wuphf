class Message < ApplicationRecord
  belongs_to :user
  belongs_to :recipient

  validates :content, presence: true, length: { maximum: 140 }
end
