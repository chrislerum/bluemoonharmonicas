require 'spec_helper'

describe Snippet do

  it "is invalid without a shortcut" do
    FactoryGirl.build(:snippet, shortcut: nil).should_not be_valid
  end
  it "is invalid without text" do
    FactoryGirl.build(:snippet, text: nil).should_not be_valid
  end
  it "rejects duplicate shortcuts" do
    FactoryGirl.create(:snippet, shortcut: 'unique')
    FactoryGirl.build(:snippet, shortcut: 'unique').should_not be_valid
  end

end
