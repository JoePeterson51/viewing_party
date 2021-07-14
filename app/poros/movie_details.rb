class MovieDetails
  attr_reader :title, :vote_avg, :runtime, :genres, :summary
  def initialize(details_hash)
    @title = details_hash[:title]
    @vote_avg = details_hash[:vote_average]
    @runtime = details_hash[:runtime]
    @genres = details_hash[:genres]
    @summary = details_hash[:overview]
  end
end