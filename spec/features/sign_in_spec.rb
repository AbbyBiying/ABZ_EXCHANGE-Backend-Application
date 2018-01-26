require "rails_helper"

feature "Signing in" do
 	it "shows me an error message with wrong user email or password" do
 		create(:user, email: 'su@gmail.com', password: 'susiesusie')
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: 'su@gmail.com'
    fill_in 'Password', with: 'xxxXXX'

    within '.container' do
      click_button 'Log in'
    end
 
    expect(page).to have_content 'Invalid Email or password'
  end
  
  it "sucessfully signed in" do
    user = create(:user)
    valid_sign_in(user)
  end
end
