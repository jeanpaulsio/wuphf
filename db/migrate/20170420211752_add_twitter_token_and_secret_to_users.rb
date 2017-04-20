class AddTwitterTokenAndSecretToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :twitter_token_digest, :string
    add_column :users, :twitter_secret_digest, :string
  end
end
