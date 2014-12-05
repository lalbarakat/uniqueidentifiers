class CreateCheckedOutItems < ActiveRecord::Migration
  def change
    create_table :checked_out_items do |t|
      t.integer :item_id
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps
    end
  end
end
