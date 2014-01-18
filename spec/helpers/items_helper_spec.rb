require 'spec_helper'

describe ItemsHelper do

  describe "#inventory_or_price_string_for" do

    it "should display the appropriate string" do
      harp_model = create(:harp_model)
      item = create(:item, manages_inventory: true, price: 10, harp_model: harp_model)

      item.quantity = 0
      inventory_or_price_string_for(item).should eq('Out of stock')

      item.quantity = 1
      inventory_or_price_string_for(item).should eq('1 left &mdash; $10.00')

      item.manages_inventory = false
      inventory_or_price_string_for(item).should eq('$10.00')
    end

  end

end
