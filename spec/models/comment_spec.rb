require "rails_helper"

RSpec.describe Comment, :type => :model do
  it "should be instantiable from group" do
    group = create(:group)
    comment = group.comments.build
    expect(comment).to be_a Comment
  end

  it "should be instantiable from listing" do
    listing = create(:listing)
    comment = listing.comments.build
    expect(comment).to be_a Comment
  end

  it "should be instantiable from offer" do
    offer = create(:offer)
    comment = offer.comments.build
    expect(comment).to be_a Comment
  end

  it "should be instantiable from exchange" do
    exchange = create(:offer)
    comment = exchange.comments.build
    expect(comment).to be_a Comment
  end

  it "should be instantiable from successful_exchange" do
    successful_exchange = create(:successful_exchange)
    comment = successful_exchange.comments.build
    expect(comment).to be_a Comment
  end
end
