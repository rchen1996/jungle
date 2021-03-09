class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order, products)
    @order = order
    @products = products
    mail(to: @order.email, subject: "Jungle Order ID: #{@order.id}")
  end
end
