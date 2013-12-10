class CartsController < ApplicationController
  before_filter :check_inventory

  def show
    @cart = current_cart
  end

  private
    def check_inventory
      if current_cart.check_inventory
        flash[:notice] = "The availability for one or more of the items in your cart has changed. The quantites below have been modified to accomodate that change."
      end
    end
end
