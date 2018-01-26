require "rails_helper"

describe "create group process", type: :feature do
  it "sucessfully create an group" do
    valid_sign_in
    create_group
  end
end
