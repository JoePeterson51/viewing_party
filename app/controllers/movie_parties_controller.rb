class MoviePartiesController < ApplicationController
  def new
    @movie_details = MovieFacade.movie_details(params[:id])
    @movie_party = MovieParty.new
  end

  def create
    params.merge!(date: (params["time(3i)"] + '/' + params["time(2i)"] + '/' + params["time(1i)"]))
    params.merge!(start_time: (params["time(4i)"] + ':' + params["time(5i)"]))
    params.merge!(user_id: current_user.id)
    params.merge!(movie_api_id: params["movie_id"])
    params.merge!(movie_title: params["title"])
    new_movie_party = MovieParty.create(movie_party_params)
    if new_movie_party.save
      params["friend"].each do |friend|
        params.merge!(user_id: friend.to_i)
        params.merge!(movie_party_id: params["movie_id"])
        Invite.create(invite_params)
      end
      redirect_to user_dashboard_index_path
    else
      render :new
    end
  end

private


  def movie_party_params
    params.permit(:movie_api_id, :date, :start_time, :duration, :user_id)
  end

  def invite_params
    params.permit(:user_id, :movie_party_id)
  end
end