class CartItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity
  belongs_to :cart
  validates_numericality_of :quantity, :greater_than => 0
end
