module Features

  def valid_sign_up(email_address = "abby@example.com")
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: email_address
    fill_in 'Username', with: "Abby"
    fill_in 'Password', with: "123123"
    fill_in 'City', with: "New York"
    fill_in 'State', with: "NY"
    fill_in 'Bio', with: "I am an artist."
    click_button "Sign up"
  end 

end
