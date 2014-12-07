class CheckedoutItem < ActiveRecord::Base
  belongs_to :checkout, :autosave => true
  has_one :item, :foreign_key => "id"
  attr_accessible :enddate, :checkout_id, :item_id, :startdate, :status, :item_attributes
  accepts_nested_attributes_for :item
  
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :enddate, presence: true
end
