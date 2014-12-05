class RemoveEndDateFromCheckouts < ActiveRecord::Migration
  def up
    remove_column :checkouts, :enddate
  end

  def down
    add_column :checkouts, :enddate, :datetime
  end
end
