class AdminController < ApplicationController
  layout 'admin'
  before_filter :check_admin

  def check_admin
    redirect_to :root unless admin?
  end
end
