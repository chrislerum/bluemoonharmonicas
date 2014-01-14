require 'spec_helper'

describe "home page shows harp model, and a harp with a main image" do
  it "shows the item when click on that model" do
    harp_model = create(:harp_model, name: 'MS Series')
    item = create(:item, harp_model: harp_model)
    item_image = create(:item_image, item: item, main_image: true)
    visit root_path
    click_on 'Products'
    click_on 'MS Series'
  end
end
