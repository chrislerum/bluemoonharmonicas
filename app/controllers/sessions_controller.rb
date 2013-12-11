class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user] = @user.id
      redirect_to account_path, notice: "You've been signed in. #{view_context.link_to 'Sign out?', session_path, method: :delete}"
    else
      flash[:error] = 'Incorrect username or password.'
      redirect_to login_path
    end
  end

  def destroy
    session[:cart_id] = nil
    session[:current_user] = nil
    redirect_to root_path, notice: 'You have been signed out.'
  end
end
