module Features

  def valid_sign_in(user = nil)
    user ||= create(:user)
    user.confirm
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content "Welcome"
  end
end
