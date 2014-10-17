class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user!
  layout "admin"
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to(admin_products_path, :notice => "Product was created successfully")
    else
      render "new"
    end
  end
  def index
    @q = Product.search(params[:q])
    @products = @q.result(distinct: true).includes(:category)
  end
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    redirect_to admin_products_url
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_url
  end
end