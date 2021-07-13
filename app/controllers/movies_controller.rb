class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.top_movies_list
  end

  def search
    @movies = MovieFacade.movie_search_list(params[:search])
  end

  def show

  end
end