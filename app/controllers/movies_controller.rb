class MoviesController < ApplicationController
  def show
  end

  def trailer
    @movie = Movie.find(params[:id])
    @movie.get_trailer
    @movie
  end
end
