require 'spec_helper'

describe Snippet do

  it "is invalid without a shortcut" do
    build(:snippet, shortcut: nil).should_not be_valid
  end
  it "is invalid without text" do
    build(:snippet, text: nil).should_not be_valid
  end
  it "rejects duplicate shortcuts" do
    create(:snippet, shortcut: 'unique')
    build(:snippet, shortcut: 'unique').should_not be_valid
  end

end
