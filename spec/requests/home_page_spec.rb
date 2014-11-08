require 'spec_helper'

describe "home page shows comb model, and a comb with a main image" do
  it "shows the comb when click on that model" do
    model = create(:model, name: 'MS Series')
    comb = create(:comb, model: model)
    comb_image = create(:comb_image, comb: comb)
    visit root_path
    click_on 'Products'
    expect(page).to have_link('MS Series')
  end
end

describe "home page shows harp model, and a harp without a main image(shows default image instead)" do
  it "shows the comb when click on that model" do
    model = create(:model, name: 'MS Series')
    comb = create(:comb, model: model)
    visit root_path
    click_on 'Products'
    click_on 'MS Series'
    expect(page.find('td a img')['src']).to have_content 'default_main_image.jpg'
  end
end
