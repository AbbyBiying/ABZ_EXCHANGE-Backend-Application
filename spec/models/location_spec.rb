require "rails_helper"

RSpec.describe Location, type: :model do
  it "should get geocoded with lat and lng" do
    location = create(:location)

    expect(location.latitude).to eql 40.7143528
    expect(location.longitude).to eql -74.0059731
  end
end
