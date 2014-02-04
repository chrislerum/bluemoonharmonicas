class LineItemsController < ApplicationController
  def create
    @line_item = LineItem.new(params[:line_item])
    @line_item.unit_price = @line_item.purchasable.price
    @line_item.cart = current_cart

    if @line_item.save
      respond_to do |format|
        format.html do
          flash[:notice] = "The item has been added to your cart."
          redirect_to current_cart_url
        end
        format.js
      end
    else
      flash[:error] = "Please choose a quantity that is lower than the amount we have in stock. We don't accept backorders."
      redirect_to :back
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    unless @line_item.cart.purchased_at
      if @line_item.destroy
        respond_to do |format|
          format.html { redirect_to current_cart_url }
          format.js
        end
      end
    end
  end
end
