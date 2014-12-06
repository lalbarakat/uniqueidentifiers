class AddCheckoutIdToCheckedOutItem < ActiveRecord::Migration
  def change
    add_column :checked_out_items, :checkout_id, :integer
  end
end
