class CreateCheckedoutItems < ActiveRecord::Migration
  def up
    create_table :checkedout_items do |t|
      t.integer :checkout_id
      t.integer :item_id
      t.datetime :startdate
      t.datetime :enddate
      t.integer :status

      t.timestamps
    end
  end
  
  def down
    drop_table :checkedout_items
  end
end
