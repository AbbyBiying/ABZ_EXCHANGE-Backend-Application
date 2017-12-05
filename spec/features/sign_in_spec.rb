require "rails_helper"

feature "Signing in" do
 	it "shows me an error message with wrong user email or password" do
 		create(:user, email: 'su@gmail.com', password_digest: 'susie')
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: "su@gmail.com"
    fill_in 'Password', with: "xxx"

    within '.container' do
      click_button 'Sign In'
    end
 
    expect(page).to have_content 'Wrong email or password'
  end


  it "sucessfully signed in" do
    valid_sign_in
  end
end
