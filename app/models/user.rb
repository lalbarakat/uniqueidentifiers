class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  attr_accessible :email, :firstname, :lastname, :permissions, :password, :username, :password_confirmation
  has_secure_password
  validates :password, length: { minimum: 6 }
end
