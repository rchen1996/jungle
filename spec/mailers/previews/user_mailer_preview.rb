# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def order_email
    line_items = LineItem.where('order_id = ?', 6)
    @products =
      line_items.map do |item|
        {
          product: Product.find_by(id: item.product_id),
          quantity: item[:quantity],
          total: item[:total_price_cents],
        }
      end

    UserMailer.order_email(Order.find(6), @products)
  end
end
