class Search
  attr_reader :results
  
  def initialize(query_string) 
    @query_string = query_string
  end

  def perform
    @results = []
    @results += User.find_user_by_username(@query_string)
    @results += Listing.find_by_name(@query_string)
    @results += Offer.find_by_name(@query_string)
    @results += Image.find_by_name(@query_string)
    @results += Group.find_by_name(@query_string)
    @results += Comment.find_comment(@query_string)
  end
end
