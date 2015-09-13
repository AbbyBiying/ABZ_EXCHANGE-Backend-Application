require "rails_helper"

describe "the signup process", :type => :feature do

  it "signs me up" do
    visit root_path
    click_on "Sign Up"
    fill_in "Username", with: "Cat Bear"
    click_on "Create User"
    expect(page).to have_content "Email can't be blank"
  end

  pending
  it "blah blah" do

  end

end
