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

  def self.movie_details(id)
    json = ImdbService.movie_details_search(id)
    MovieDetails.new(json)
  end

  def self.movie_cast(id)
    json = ImdbService.movie_cast_search(id)
    actors = json[:cast].find_all do |json_cast|
      json_cast[:known_for_department] == "Acting"
    end
    actors.map do |actor|
      MovieCast.new(actor)
    end
  end

  def self.movie_reviews(id)
    json = ImdbService.movie_review_search(id)
    json[:results].map do |json_reviews|
      MovieReview.new(json_reviews)
    end
  end
end