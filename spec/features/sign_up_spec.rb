require "rails_helper"

describe "the signup process", type: :feature do
  # it "shows me an error message if I select dropdown location and input location together" do
  # 	create(:location, city: "Williamstown", state: "VT")

  # 	visit '/'
  #   click_link 'Sign Up'
  #   fill_in 'Email', with: 'abby@example.com'
  #   fill_in 'Username', with: "Abby"
  #   fill_in 'Password', with: "123123"
  #   select 'WILLIAMSTOWN, VT', from: "user_location_id" 

  #   fill_in 'City', with: "New York"
  #   fill_in 'State', with: "NY"
  #   fill_in 'Bio', with: "I am an artist."

  #   click_button "Create User"

  #   expect(page).to have_content "Sorry, you have to select one location either from dropdown menu or from the input form."
  #   ERROR MESSAGE"
  # end

	it "shows me an error message if I select the same location at drop down and input field" do
		create(:location, city: "Williamstown", state: "VT")

		visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'abby@example.com'
    fill_in 'Username', with: "Abby"
    fill_in 'Password', with: "123123"
    select 'WILLIAMSTOWN, VT', from: "user_location_id" 

    fill_in 'City', with: "Williamstown"
    fill_in 'State', with: "VT"
    fill_in 'Bio', with: "I am an artist."

    click_button "Submit"

		expect(page).to have_content "Sorry, the location already exists in our dropdown menu"
	end

  it "signs me up" do
    valid_sign_up
  end

  it "show locations in dropdown menu in alphabetical order" do   
    create(:location, city: "Boston", state: "MA")
    create(:location, city: "ALLSTON", state: "MA")
    create(:location, city: "Williamstown", state: "VT")

    visit '/'
    click_link 'Sign Up'
    expect(page).to have_content "ALLSTON, MA BOSTON, MA WILLIAMSTOWN, VT"
  end

  # it "shows other option at the bottom of the location dropdown menu" do
  # end

  # it "shows input when user click on 'other' in the location dropdown menu" do
  # end

  # it "shows new input location in the dropdown menu" do
  # end

  # it "shows a error message when user input a location in the other option which is already exist in the dropdown menu" do
  # end
end

