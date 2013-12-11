class AddDataCaptureFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :email, :string
    add_column :orders, :address, :string
  end
end
