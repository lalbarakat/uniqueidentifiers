class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :student_id
      t.string :item_id
      t.timestamp :startdate
      t.timestamp :enddate

      t.timestamps
    end
  end
end
