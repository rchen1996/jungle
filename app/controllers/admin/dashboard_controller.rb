class Admin::DashboardController < ApplicationController
  def show
    @products = Product.count
    @categories = Category.count
  end
end
