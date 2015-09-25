require "rails_helper"

describe "create group process", type: :feature do

  it "sucessfully create an group" do
    valid_sign_up

    create_group
  end
end
