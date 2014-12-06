class Checkout < ActiveRecord::Base
  has_many :checked_out_items
  belongs_to :student, :autosave => true
  attr_accessible :student_id, :checked_out_items_attributes, :student_attributes
  accepts_nested_attributes_for :checked_out_items
  accepts_nested_attributes_for :student
end
