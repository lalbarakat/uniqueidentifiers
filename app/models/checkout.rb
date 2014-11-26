class Checkout < ActiveRecord::Base
  has_one :student
  attr_accessible :enddate, :item_id, :startdate, :student_id
end
