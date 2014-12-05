class CheckedOutItem < ActiveRecord::Base
  belongs_to :checkout
  has_one :item
  attr_accessible :enddate, :item_id, :startdate
end
