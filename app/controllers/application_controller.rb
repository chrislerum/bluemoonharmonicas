class ApplicationController < ActionController::Base
  helper :all
  helper_method :current_cart
  helper_method :current_user
  helper_method :admin?
  before_filter :current_cart

  protect_from_forgery

  def current_cart
    if @current_cart && @current_cart.purchased_at
      session[:cart_id] = nil
    end

    if current_user && current_user.carts.any? && current_user.carts.last.purchased_at.nil?
      @current_cart = current_user.carts.last
    else

      if session[:cart_id] && Cart.exists?(session[:cart_id])
        @current_cart = Cart.find(session[:cart_id])
      else
        if current_user
          @current_cart = current_user.carts.create!
        else
          @current_cart = Cart.create!
        end
      end

    end

    session[:cart_id] = @current_cart.id
    @current_cart
  end
  
  def admin?
    (current_user && current_user.admin)
  end

  def current_user 
    if session[:current_user]
      User.try(:find, session[:current_user])
    else
      nil
    end
  end
end
