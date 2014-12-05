class RemoveItemIdFromCheckouts < ActiveRecord::Migration
  def up
    remove_column :checkouts, :item_id
  end

  def down
    add_column :checkouts, :item_id, :string
  end
end
