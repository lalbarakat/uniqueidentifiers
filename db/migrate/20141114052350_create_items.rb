class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :name
      t.string :category
      t.integer :checkedout_item_id

      t.timestamps
    end
  end
  
  def down
    drop_table :items
  end
end
