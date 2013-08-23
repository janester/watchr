class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @movie.get_trailer
    @movie.get_facebook_info
    @similar = @movie.get_similar
  end

  def trailer
    @movie = Movie.find(params[:id])
    @movie.get_trailer
    @movie
  end
end
