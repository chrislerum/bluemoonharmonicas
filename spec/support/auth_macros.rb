module AuthMacros
  def login(user = nil)
    user ||= create(:user)
    visit login_path
    fill_in 'Email', user.email
    fill_in 'Password', user.password
    click_button 'Sign In'
    @_current_user = user
  end

  def current_user
    @_current_user
  end
end