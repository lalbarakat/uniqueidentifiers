class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :permissions, :password, :username
end