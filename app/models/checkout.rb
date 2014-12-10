class Checkout < ActiveRecord::Base
  has_many :checkedout_items
  belongs_to :student
  attr_accessible :student_id, :status, :checkedout_items_attributes, :student_attributes, :status
  accepts_nested_attributes_for :checkedout_items
  accepts_nested_attributes_for :student
end
