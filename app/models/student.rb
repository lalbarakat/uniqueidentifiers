class Student < ActiveRecord::Base
  has_many :checkouts, dependent: :destroy
  attr_accessible :email, :firstname, :lastname, :phonenumber, :status, :uin
end
