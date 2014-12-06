class AddCheckedOutItemIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :checked_out_item_id, :integer
  end
end
