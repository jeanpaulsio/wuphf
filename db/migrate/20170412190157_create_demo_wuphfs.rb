class CreateDemoWuphfs < ActiveRecord::Migration[5.0]
  def change
    create_table :demo_wuphfs do |t|
      t.string :from
      t.string :to
      t.text :message
      t.string :email
      t.string :phone
      t.string :twitter_handle

      t.timestamps
    end
  end
end
