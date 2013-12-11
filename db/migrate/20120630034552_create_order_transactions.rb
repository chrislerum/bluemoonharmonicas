class CreateOrderTransactions < ActiveRecord::Migration
  def change
    create_table :order_transactions do |t|
      t.references :order
      t.string :action
      t.float :amount
      t.boolean :success
      t.string :authorization
      t.string :message
      t.text :params

      t.timestamps
    end
    add_index :order_transactions, :order_id
  end
end
