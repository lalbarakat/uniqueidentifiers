class Student < ActiveRecord::Base
  belongs_to :checkout, :autosave => true
  has_many :checkouts, dependent: :destroy
  attr_accessible :email, :firstname, :lastname, :phonenumber, :status, :uin
end
