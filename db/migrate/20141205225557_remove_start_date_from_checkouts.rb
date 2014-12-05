class RemoveStartDateFromCheckouts < ActiveRecord::Migration
  def up
    remove_column :checkouts, :startdate
  end

  def down
    add_column :checkouts, :startdate, :datetime
  end
end
