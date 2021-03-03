class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.admin[:username],
                               password: Rails.configuration.admin[:password]

  def index
    @products = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to %i[admin categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
