require 'spec_helper'

describe "home page shows harp model, and a harp with a main image" do
  it "shows the item when click on that model" do
    model = create(:model, name: 'MS Series')
    item = create(:item, model: model)
    item_image = create(:item_image, item: item)
    visit root_path
    click_on 'Products'
    click_on 'MS Series'
  end
end

describe "home page shows harp model, and a harp without a main image(shows default image instead)" do
  it "shows the item when click on that model" do
    model = create(:model, name: 'MS Series')
    item = create(:item, model: model)
    visit root_path
    click_on 'Products'
    click_on 'MS Series'
    expect(page.find('td a img')['src']).to have_content 'default_main_image.jpg'
  end
end
