class CreateRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :twitter_handle
      t.string :facebook_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
