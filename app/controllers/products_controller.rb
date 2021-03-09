class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @review = Review.new
    @product = Product.find params[:id]
  end
end
