class MoviePartiesController < ApplicationController
  def new
    @movie_details = MovieFacade.movie_details(params[:id])
    @movie_party = MovieParty.new
  end

  def create

  end
  # "time(3i)"
end