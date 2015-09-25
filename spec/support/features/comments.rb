module Features

  def create_comment(name = "My Comment Name")

    create_listing("Flowers")

    fill_in "Body", with: "colorful ones"

    click_button "Create Comment"

  end
end
