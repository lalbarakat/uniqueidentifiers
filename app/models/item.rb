class Item < ActiveRecord::Base
  attr_accessible :name, :category
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :category, presence: true, length: { maximum: 50 }
end
