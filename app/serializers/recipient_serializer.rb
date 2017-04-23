class RecipientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :twitter_handle, :user_id

  has_many :messages
end
