class Student < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :phonenumber, :status, :uin
end
