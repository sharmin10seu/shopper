class Cart < ActiveRecord::Base
  STATUS = {:PENDING => :PENDING, :ORDERED => :ORDERED, :PAID => :PAID, :DELIVERED => :DELIVERED}
  attr_accessible :status, :user_id, :total_price
  has_many :cart_items
  belongs_to :user
  def total_price
    price = 0
    self.cart_items.each do |cart_item|
      price = price + ((Product.find(cart_item.product_id).price)*(cart_item.quantity.to_i))
    end
    return price
  end

end
