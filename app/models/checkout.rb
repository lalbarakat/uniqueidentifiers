class Checkout < ActiveRecord::Base
  has_many :checkedout_items
  has_many :items, :through => :checkedout_items
  belongs_to :student
  attr_accessible :student_id, :status, :checkedout_items_attributes, :student_attributes, :status, :student_id
  accepts_nested_attributes_for :checkedout_items
  accepts_nested_attributes_for :student
  
  def status_text
  	self.status == 0? "Checked Out" : "Checked In"
  end
  
  def student_attributes=(attributes)
    if attributes[:id].present?
      if(Student.find(attributes[:id]))
      	self.student = Student.find(attributes[:id])
      else
      	attributes.delete :id
        self.student = Student.new(attributes)
      end
    end
    assign_nested_attributes_for_one_to_one_association(:student, attributes)
  end
end
