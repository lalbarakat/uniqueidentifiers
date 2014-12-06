class Item < ActiveRecord::Base
  belongs_to :checked_out_item, :autosave => true
  attr_accessible :name, :checked_out_item_id
end
