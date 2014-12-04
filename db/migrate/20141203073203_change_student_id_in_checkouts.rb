class ChangeStudentIdInCheckouts < ActiveRecord::Migration
  def up
  	change_column :checkouts, :student_id, :integer
  end

  def down
  	change_column :checkouts, :student_id, :string
  end
end
