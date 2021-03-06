class HomeController < ApplicationController
  def index
    movies = Movie.all
    @in_theaters = movies.select{|x| x.kind == "in_theaters"}.sort_by{|x| (x.a_score+x.c_score)/2}.reverse
    # @box_office = movies.select{|x| x.kind == "box_office"}.sort_by{|x| (x.a_score+x.c_score)/2}.reverse
    @opening = movies.select{|x| x.kind == "opening"}.sort_by{|x| (x.a_score+x.c_score)/2}.reverse
    @upcoming = movies.select{|x| x.kind == "upcoming"}.sort_by{|x| (x.a_score+x.c_score)/2}.reverse
  end
end
