class Student < ActiveRecord::Base
  has_many :checkouts, dependent: :destroy
  attr_accessible :email, :firstname, :lastname, :phonenumber, :uin
  before_save { self.email = email.downcase }
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :phonenumber, presence: true, length: { maximum: 10 }, format: { with: /\d{10}/ }
  validates :uin, presence: true, length: { minimum: 9 }, format: { with: /\d{9}/ }
end
