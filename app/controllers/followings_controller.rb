class FollowingsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    current_user.movies << @movie
  end

  def destroy
    @movie = Movie.find(params[:id])
    Following.where(user_id:current_user.id, movie_id:@movie.id).first.delete
  end
end
