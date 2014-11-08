require 'spec_helper'

describe 'Cart' do
  it "starts out empty" do
    visit root_path
    click_on 'Cart'
    expect(page).to have_text 'The cart is empty'
  end

  it "can have an item added to it with the right price" do
    model = create(:model, name: 'MS Series')
    comb = create(:comb, model: model, name: 'Henry', quantity: 15)
    visit root_path
    click_link 'Products'
    click_link 'MS Series'
    click_link 'Henry'
    expect(page).to have_text('15 in stock')
    expect(page).to have_selector("input[value='1']")
    click_button 'Add to Cart'

  end
end
