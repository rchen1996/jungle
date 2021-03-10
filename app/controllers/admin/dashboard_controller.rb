class Admin::DashboardController < AdminController
  def show
    @products = Product.count
    @categories = Category.count
  end
end
