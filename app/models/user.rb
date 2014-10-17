class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :carts
  has_many :products

  def my_cart
    cart = self.carts.where("status = ?",Cart::STATUS[:PENDING]).first
    if cart.nil?
      cart = Cart.create(:user_id => self.id, :status => Cart::STATUS[:PENDING])
    end
    return cart
  end

end
