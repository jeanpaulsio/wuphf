class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :provider, :string, null: false, default: 'email'
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :tokens, :text

    # inspired by https://github.com/lynndylanhurley/devise_token_auth/issues/181
    User.reset_column_information
    User.find_each do |login|
      login.uid = login.email
      login.provider = 'email'
      login.save!
    end

    add_index :users, [:uid, :provider], unique: true
  end

  def down
    remove_columns :users, :provider, :uid, :tokens
    remove_index :users, name: :index_logins_on_uid_and_provider
  end
end
