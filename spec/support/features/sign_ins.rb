module Features

  def valid_sign_in(email_address = "abby@example.com")
    visit '/'
    click_link 'Sign In'
    fill_in 'Username', with: "Abby"
    fill_in 'Password', with: "123123"
    click_button "Sign In"
  end

end
