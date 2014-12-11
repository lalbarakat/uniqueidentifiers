class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string :uin
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phonenumber

      t.timestamps
    end
  end
  
  def down
    drop_table :students
  end
end
