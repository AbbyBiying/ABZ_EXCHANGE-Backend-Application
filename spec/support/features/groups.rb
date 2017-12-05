module Features

  def create_group(name = "My Group Name")

    click_on "Group"
    click_on "Make New Group"
    fill_in "Name", with: "Flowers"
    fill_in "Description", with: "colorful ones"

    click_button "Submit"
  end
end
