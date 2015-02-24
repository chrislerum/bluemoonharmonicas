class FaqsController < ApplicationController
  def index
    OrderMailer.email_test.deliver
    @faqs = Faq.all(order: :position)
  end

  def sort
    if admin?
      params[:faqs].each_with_index do |id, index|
        Faq.update_all(['position=?', index+1], ['id=?', id])
      end

      render nothing: true
    else
      render status: 403
    end
  end
end
