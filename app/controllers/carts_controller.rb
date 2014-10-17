class CartsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @cart = current_user.my_cart
   @cart_items = CartItem.where("cart_id = ?",@cart.id )
  end
  def update
    @cart = Cart.find(params[:id])
    @cart.status = Cart::STATUS[:ORDERED]
    @cart.save
    redirect_to carts_path
  end
end
