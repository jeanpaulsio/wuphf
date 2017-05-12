class RemoveToFromDemoWuphfs < ActiveRecord::Migration[5.0]
  def change
    remove_column :demo_wuphfs, :to, :string
  end
end
