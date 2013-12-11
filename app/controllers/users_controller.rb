class UsersController < ApplicationController
  before_filter :check_if_id_or_current, only: [:show, :edit, :update]
  before_filter :redirect_if_signed_out, except: [:new, :create]

  def index
    @users = User.all
    authorize! :read, @users
  end

  def new
    if current_user
      redirect_to account_path
    else
      @user = User.new
    end
  end

  def edit
    authorize! :edit, @user
  end

  def show
    @orders = @user.try(:orders).order('created_at DESC')
    authorize! :read, @user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:current_user] = @user.id
      redirect_to account_path, notice: 'Thanks for signing up! Here are your account details.'
    else
      redirect_to login_path, notice: 'There was an error.'
    end
  end

  def update
    authorize! :update, @user

    # Check if password is correct
    if @user.authenticate(params[:password])
      if @user.update_attributes(params[:user])
        redirect_to account_path
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user

    @user.destroy
  end

  private
    def redirect_if_signed_out
      if current_user.nil?
        redirect_to root_path
      end
    end

    def check_if_id_or_current
      begin
        @user = User.find(params[:id])
      rescue
        if params['id'] == 'current'
          @user = current_user
        end
      end
    end
end
