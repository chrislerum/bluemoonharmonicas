require 'spec_helper'

describe 'Cart' do
  it "starts out empty" do
    visit root_path
    click_on 'Cart'
    expect(page).to have_text 'The cart is empty'
  end

  it "can have an item added to it with the right price", js: true do
    click_on 'Products'
  end
end
