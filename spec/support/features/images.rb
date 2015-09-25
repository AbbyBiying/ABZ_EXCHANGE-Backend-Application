module Features

  def create_image(name = "My Image Name")

    visit new_image_path
    fill_in "Name", with: "Flowers"
    fill_in "Description", with: "colorful ones"

    click_button "Create Image"

  end
end
