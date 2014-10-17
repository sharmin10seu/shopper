class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :discount, :price, :quantity, :title, :user_id
  belongs_to :category
  belongs_to :user
  validates :title, presence: true
  validates :price, presence: true, numericality: true
  validates :discount, presence: true
  def save_in_parcentage
    100-((self.discounted_price/self.price)*100)
  end
  def discounted_price
    self.price-self.discount
  end
  def similar_products
    Product.where('category_id = ? and id != ?'  ,self.category.id, self.id  )
  end
end
