class Student < ActiveRecord::Base
  has_many :students
  attr_accessible :email, :firstname, :lastname, :phonenumber, :status, :uin
end
