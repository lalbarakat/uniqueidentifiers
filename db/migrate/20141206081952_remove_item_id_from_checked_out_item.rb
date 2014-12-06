class RemoveItemIdFromCheckedOutItem < ActiveRecord::Migration
  def up
    remove_column :checked_out_items, :item_id
  end

  def down
    add_column :checked_out_items, :item_id, :integer
  end
end
