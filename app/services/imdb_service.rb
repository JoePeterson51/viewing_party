class ImdbService

  def self.top_movies
    url_1 = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['TMDB_API_KEY']}&page=1"
    response_1 = Faraday.get(url_1)
    json_1 = JSON.parse(response_1.body, symbolize_names: true)

    url_2 = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['TMDB_API_KEY']}&page=2"
    response_2 = Faraday.get(url_2)
    json_2 = JSON.parse(response_2.body, symbolize_names: true)

    json_1[:results] + json_2[:results]
  end

  def self.movie_search(title)
    url_1 = "https://api.themoviedb.org/3/search/movie?query=#{title}&api_key=#{ENV['TMDB_API_KEY']}&page=1"
    response_1 = Faraday.get(url_1)
    json_1 = JSON.parse(response_1.body, symbolize_names: true)

    url_2 = "https://api.themoviedb.org/3/search/movie?query=#{title}&api_key=#{ENV['TMDB_API_KEY']}&page=2"
    response_2 = Faraday.get(url_2)
    json_2 = JSON.parse(response_2.body, symbolize_names: true)

    json_1[:results] + json_2[:results]
  end

  def self.movie_details_search(id)
    url = "https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['TMDB_API_KEY']}"
    response = Faraday.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_cast_search(id)
    url = "https://api.themoviedb.org/3/movie/#{id}/credits?api_key=#{ENV['TMDB_API_KEY']}"
    response = Faraday.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_review_search(id)
    url = "https://api.themoviedb.org/3/movie/#{id}/reviews?api_key=#{ENV['TMDB_API_KEY']}"
    response = Faraday.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end
end