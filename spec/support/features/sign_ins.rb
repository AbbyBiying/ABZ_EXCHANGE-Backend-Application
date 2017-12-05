module Features

  def valid_sign_in(email_address = "abby@example.com")
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: email_address
    fill_in 'Password', with: "123123"
    click_button "Sign In"
  end

end
