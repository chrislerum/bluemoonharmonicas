require 'spec_helper'

describe "Users request" do
  before :each do 
    @user = FactoryGirl.create(:user)
  end

  let(:user) { @user }
  subject { user }

  context "#authorization" do
    it "signs in users" do
      visit login_path
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button "Sign In"

      page.should have_content user.name
    end

    it "signs out users" do  
      visit login_path
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button "Sign In"

      click_link "Sign Out"
      page.should_not have_content "Account"
    end
  end
end
