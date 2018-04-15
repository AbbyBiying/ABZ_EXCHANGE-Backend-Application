require "rails_helper"

RSpec.describe Search, type: :model do
  describe "#perform" do
    # Mockist Test
    it "should perform search and set the value in results" do
      search = Search.new("b")

      expect(User).to receive(:find_user_by_username).with("b").and_return(["abc","ab"])
      expect(Listing).to receive(:find_by_name).with("b").and_return(["abc","ab"])
      expect(Offer).to receive(:find_by_name).with("b").and_return(["abc","ab"])
      expect(Image).to receive(:find_by_name).with("b").and_return(["abc","ab"])
      expect(Group).to receive(:find_by_name).with("b").and_return(["abc","ab"])
      expect(Comment).to receive(:find_comment).with("b").and_return(["abc","ab"])

      search.perform

      expect(search.results).to eql ["abc", "ab", "abc", "ab", "abc", "ab", "abc", "ab", "abc", "ab", "abc", "ab"]
    end
  end
end