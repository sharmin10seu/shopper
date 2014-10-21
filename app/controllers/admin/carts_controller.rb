class Admin::CartsController < ApplicationController
  layout "admin"

  def index
    @carts =Cart.where("status=?", Cart::STATUS[:ORDERED].to_s)
  end
end