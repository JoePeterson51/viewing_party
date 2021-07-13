class MovieFacade
  def self.top_movies_list
    json = ImdbService.top_movies
    json.map do |json_movie|
      Movie.new(json_movie)
    end
  end

  def self.movie_search_list(title)
    json = ImdbService.movie_search(title)
    json.map do |json_movie|
      Movie.new(json_movie)
    end
  end
end