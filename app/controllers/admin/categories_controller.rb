class Admin::CategoriesController < ApplicationController
  layout "admin"
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to(admin_categories_path, :notice => "Category was created successfully")
    else
      render "new"
    end
  end
  def index
    @categories = Category.all
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    redirect_to admin_categories_url
  end
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_url
  end
end