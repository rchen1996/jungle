class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order, products)
    @order = order
    @products = products
    mail(to: @order.email, subject: "Order Id ##{@order.id} from Jungle")
  end
end
