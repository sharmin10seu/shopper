class CartItemsController < ApplicationController
  def create

    cart = current_user.carts.where("status=?", Cart::STATUS[:PENDING].to_s).first
    if !cart.present?
      cart = Cart.create(:user_id => current_user.id, :status => Cart::STATUS[:PENDING].to_s)
    end

    @cart_item = CartItem.new(params[:cart_item])
    @cart_item.cart = cart
    @cart_item.save
    redirect_to products_path
  end
  def index
  end
  def update
    #raise (params[:cart_item][:quantity]).to_i.inspect
    @cart_item = CartItem.find(params[:id])
    if (params[:cart_item][:quantity]).to_i > Product.find(@cart_item.product_id).quantity
      redirect_to carts_url, notice:"You can not buy more than #{Product.find(@cart_item.product_id).quantity}"
    else
      @cart_item.update_attributes(params[:cart_item])
      redirect_to carts_url
    end
  end
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_url
  end
end
