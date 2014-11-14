class Checkout < ActiveRecord::Base
  attr_accessible :enddate, :item_id, :startdate, :student_id
end
