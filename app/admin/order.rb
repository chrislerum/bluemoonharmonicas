ActiveAdmin.register Order do

  index do
    column :id
    column :first_name
    column :last_name
    column :email
    default_actions
  end

  form do |f|
    f.inputs "Order Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :ip_address
      row :created_at
      row :updated_at
      row :email
      row :address do |order|
        order.address.map{|k,v| "#{v}" }.join(' ')
      end
      if order.cart.nil?
        panel "Error" do
          "This order is invalid: it has no cart."
        end
      elsif order.cart.line_items.count == 0
        panel "Error" do
          "This order is invalid: its cart has no items."
        end
      else
        panel "Purchased Items" do
          table_for order.cart.line_items.each do
            column "Type" do |line_item|
              line_item.purchasable.class
            end
            column "Name" do |line_item|
              line_item.purchasable.name
            end
            column "Quantity" do |line_item|
              line_item.quantity.to_s
            end
            column "Unit Price" do |line_item|
              humanized_money_with_symbol line_item.unit_price
            end
            column "Subtotal" do |line_item|
              humanized_money_with_symbol line_item.quantity * line_item.unit_price
            end
          end
        end
        panel "Total" do
          total = 0
          order.cart.line_items.each do |li|
            total += li.quantity * li.unit_price
          end
          humanized_money_with_symbol total
        end
      end
    end
  end
end
