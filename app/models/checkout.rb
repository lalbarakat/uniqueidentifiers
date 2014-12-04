class Checkout < ActiveRecord::Base
  belongs_to :student
  attr_accessible :enddate, :item_id, :startdate, :student_id
end
