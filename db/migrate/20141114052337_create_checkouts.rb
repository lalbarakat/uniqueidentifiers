class CreateCheckouts < ActiveRecord::Migration
  def up
    create_table :checkouts do |t|
      t.integer :student_id
      t.integer :status
      
      t.timestamps
    end
  end
  
  def down
    drop_table :checkouts
  end
end
