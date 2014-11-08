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

    if Rails.env.production?
      mail(to: %w[harpcombs@yahoo.com chris.lerum@gmail.com], subject:"BMH Order \##{order.id}")
    else
      mail(to: %w[chris.lerum@gmail.com], subject:"TEST ORDER: BMH Order \##{order.id}")
    end
  end
end
