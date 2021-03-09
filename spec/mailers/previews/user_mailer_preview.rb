# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def order_email
    products = Product.all
    UserMailer.order_email(Order.first, products)
  end
end
