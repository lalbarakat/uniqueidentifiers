class CheckedOutItem < ActiveRecord::Base
  belongs_to :checkout, :autosave => true
  has_one :item
  attr_accessible :enddate, :checkout_id, :startdate, :item_attributes
  accepts_nested_attributes_for :item
end
