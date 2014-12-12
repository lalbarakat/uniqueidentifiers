class CheckedoutItem < ActiveRecord::Base
  belongs_to :checkout
  belongs_to :item
  has_one :student, :through => :checkout
  attr_accessible :enddate, :checkout_id, :item_id, :startdate, :status, :item_attributes
  accepts_nested_attributes_for :item
  
  validates :startdate, presence: true
  validates :enddate, presence: true
  
  def status_text
  	self.status == 0? "Checked Out" : "Checked In"
  end
  
  def item_attributes=(attributes)
    if attributes['id'].present?
      begin
      	self.item = Item.find(attributes[:id])
      rescue ActiveRecord::RecordNotFound => e
      	ident = attributes[:id]
      	attributes.delete :id
      	raise $!, "ID: " + ident
      end
    end
    assign_nested_attributes_for_one_to_one_association(:item, attributes)
  end
end
