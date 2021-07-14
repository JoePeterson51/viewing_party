class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.top_movies_list
  end

  def search
    @movies = MovieFacade.movie_search_list(params[:search])
  end

  def show
    @movie_details = MovieFacade.movie_details(params[:id])
    @movie_cast = MovieFacade.movie_cast(params[:id]).first(10)
    @movie_reviews = MovieFacade.movie_reviews(params[:id])
    # require 'pry'; binding.pry
  end
end