class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  has_many :carts
  has_many :orders

  validates :email, uniqueness: true, format: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  has_secure_password

  def promote_to_admin
    write_attribute(:admin, true)
    save
  end

  def demote_to_user
    write_attribute(:admin, false)
    save
  end
end
