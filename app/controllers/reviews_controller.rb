class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])

    @review = @product.reviews.new(review_params)
    @review[:product_id] = params[:product_id]
    @review[:user_id] = current_user.id

    if @review.save
      redirect_to product_url params[:product_id]
    else
      render 'products/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
