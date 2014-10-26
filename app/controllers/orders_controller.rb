class OrdersController < ApplicationController
  def express
    response = GATEWAY.setup_purchase(current_cart.build_order.price_in_cents,
      :ip                => request.remote_ip,
      :return_url        => new_order_url,
      :cancel_return_url => current_cart_url,
      :description       => "Purchasing #{view_context.pluralize(current_cart.number_of_items, 'product')} from Blue Moon Harmonicas, LLC.",
      :amount            => current_cart.total_price,
      :currency          => "USD"
    )
    redirect_to GATEWAY.redirect_url_for(response.token)
  end

  def new
    @order = Order.new(express_token: params[:token])
    @order.cart = current_cart
    @cart = current_cart
  end

  def create
    @order = current_cart.build_order(params[:order])
    @order.user = current_user
    @order.ip_address = request.remote_ip

    if !@order.cart.check_inventory
      if @order.save
        if @order.purchase
          OrderMailer.order_receipt(@order).deliver
          OrderMailer.order_summary(@order).deliver
          if current_user.nil?
            redirect_to root_path, notice: "Your order has been placed and a confirmation email has been sent to #{@order.email}."
          else
            redirect_to order_path(@order), notice: "Your order has been placed and a confirmation email has been sent to #{current_user.email}."
          end
        else
          redirect_to current_cart_path, notice: 'Something went wrong with your order. Please try again later.'
        end
      else
        render :action => 'new'
      end
    else
      redirect_to :back, notice: "The availability for one or more of the items in your cart has changed. The quantites below have been modified to accomodate that change; please look them over and ensure they are acceptable."
    end
  end

  def show
    if current_user
      @order = Order.find(params[:id])
      @cart = @order.cart
      respond_to do |format|
        format.html
        format.pdf do
          pdf = OrderPdf.new(@order, view_context)
          send_data pdf.render, filename: "order_#{@order.id}.pdf",
                                type: "application/pdf",
                                disposition: "inline"
        end
      end
    else
      redirect_to login_path
    end

    authorize! :read, @order
  end

end
