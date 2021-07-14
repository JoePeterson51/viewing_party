class MovieReview
  attr_reader :author, :review, :author_details
  def initialize(reviews_hash)
    @author = reviews_hash[:author]
    @review = reviews_hash[:content]
    @author_details = reviews_hash[:author_details]
  end
end