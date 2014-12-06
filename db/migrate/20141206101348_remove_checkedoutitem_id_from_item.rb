class RemoveCheckedoutitemIdFromItem < ActiveRecord::Migration
  def up
    remove_column :items, :checkedoutitem_id
  end

  def down
    add_column :items, :checkedoutitem_id, :integer
  end
end
