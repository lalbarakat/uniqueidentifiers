class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :uin
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phonenumber
      t.string :status

      t.timestamps
    end
  end
end
