require "rails_helper"

describe "create image process", type: :feature do
  it "sucessfully create an image" do
    valid_sign_up
    create_image("Flowers")
  end
end
