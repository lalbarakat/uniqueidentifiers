class Checkout < ActiveRecord::Base
  has_many :checkedoutitems
  belongs_to :student
  attr_accessible :student_id, :checkedoutitems
  accepts_nested_attributes_for :checkedoutitems
end
