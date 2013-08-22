class HomeController < ApplicationController
  def index
    Movie.get_movies
    @movies = Movie.all
  end
end
