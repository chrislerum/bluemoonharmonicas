class OrderMailer < ActionMailer::Base
  include ActionView::Helpers::TextHelper
  default from: "\"Blue Moon Harmonicas, LLC\" <orders@bluemoonharmonicas.com>"

  def order_receipt(order)
    @order = order
    mail(to: order.email, subject: 'Your Order Confirmation')
  end

  def order_summary(order)
    @order = order
    
    attachments["Invoice \##{order.id}.pdf"] = OrderPdf.new(order, view_context).render

    mail(to: %w[harpcombs@yahoo.com petryk.steven@gmail.com], subject:"BMH Order \##{order.id}")
  end
end
