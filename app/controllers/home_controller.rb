class HomeController < ApplicationController
  def index
    Movie.get_movies
  end
end
