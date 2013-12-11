class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :cart
      t.string :first_name
      t.string :last_name
      t.string :ip_address
      t.string :express_token
      t.string :express_payer_id
      t.references :user

      t.timestamps
    end
    add_index :orders, :cart_id
    add_index :orders, :user_id
  end
end
