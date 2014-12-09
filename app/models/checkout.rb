class Checkout < ActiveRecord::Base
  has_many :checkedout_items, :inverse_of => :checkout
  belongs_to :student, :autosave => true, :inverse_of => :checkouts
  attr_accessible :student_id, :status, :checkedout_items_attributes, :student_attributes, :status
  accepts_nested_attributes_for :checkedout_items
  accepts_nested_attributes_for :student
end
