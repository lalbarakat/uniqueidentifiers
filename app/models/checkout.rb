class Checkout < ActiveRecord::Base
  has_many :checkedout_items
  has_many :items, :through => :checkedout_items
  belongs_to :student
  attr_accessible :student_id, :status, :checkedout_items_attributes, :student_attributes, :status
  accepts_nested_attributes_for :checkedout_items
  accepts_nested_attributes_for :student
  
  def status_text
  	self.status == 0? "Checked Out" : "Checked In"
  end
end
