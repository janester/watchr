class HomeController < ApplicationController
  def index
    # Movie.get_movies
    movies = Movie.all
    # ["box_office", "in_theaters", "opening", "upcoming"]
    @in_theaters = movies.select{|x| x.kind == "in_theaters"}
    @box_office = movies.select{|x| x.kind == "box_office"}
    @opening = movies.select{|x| x.kind == "opening"}
    @upcoming = movies.select{|x| x.kind == "upcoming"}
  end
end
