class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @movie.get_trailer
    @movie.get_facebook_info
    # Post.get_facebook_posts(@movie)
    @facebook_posts = @movie.posts.select{|x| x.kind == "facebook"}.sort_by(&:posted_at).reverse
    @similar = @movie.get_similar
  end

  def trailer
    @movie = Movie.find(params[:id])
    @movie.get_trailer
    @movie
  end
end
