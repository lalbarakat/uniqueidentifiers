class Item < ActiveRecord::Base
  belongs_to :checkedoutitem
  attr_accessible :name
end
