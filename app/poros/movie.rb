class Movie
  attr_reader :id, :title, :vote_avg

  def initialize(movie_hash)
    @id = movie_hash[:id]
    @title = movie_hash[:title]
    @vote_avg = movie_hash[:vote_average]
  end
end