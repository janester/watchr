# == Schema Information
#
# Table name: movies
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  year            :string(255)
#  runtime         :integer
#  poster          :string(255)
#  synopsis        :text
#  a_score         :integer          default(0)
#  c_score         :integer          default(0)
#  o_poster        :string(255)
#  t_poster        :string(255)
#  d_poster        :string(255)
#  p_poster        :string(255)
#  similar         :string(255)
#  url             :string(255)
#  rt_id           :integer
#  imdb_id         :integer
#  theater_release :date
#  dvd_release     :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  kind            :string(255)
#

class Movie < ActiveRecord::Base
  attr_accessible :a_score,
    :c_score,
    :poster,
    :runtime,
    :synopsis,
    :title,
    :year,
    :o_poster,
    :t_poster,
    :d_poster,
    :p_poster,
    :similar,
    :url,
    :rt_id,
    :imdb_id,
    :theater_release,
    :dvd_release,
    :kind

  has_many :followings
  has_many :users, :through => :followings
  has_many :characters
  has_many :actors, :through => :characters

  def Movie.create_movies(movies, kind)
    movies.each do |movie|
      new_movie = Movie.find_or_initialize_by_rt_id(movie["id"])
      new_movie.update_attributes(:a_score => movie["ratings"]["audience_score"],
                                                :c_score => movie["ratings"]["critics_score"],
                                                :runtime => movie["runtime"],
                                                :synopsis => movie["synopsis"],
                                                :title => movie["title"],
                                                :year => movie["year"],
                                                :o_poster => movie["posters"]["original"],
                                                :t_poster => movie["posters"]["thumbnail"],
                                                :d_poster => movie["posters"]["detailed"],
                                                :p_poster => movie["posters"]["profile"],
                                                :similar => movie["links"]["similar"],
                                                :url => movie["links"]["self"],
                                                :rt_id => movie["id"],
                                                :imdb_id => movie["alternate_ids"]["imdb"],
                                                :theater_release => movie["release_dates"]["theater"],
                                                :dvd_release => movie["release_dates"]["dvd"],
                                                :kind => kind
                                                )
      movie["abridged_cast"].each do |actor|
        new_actor = Actor.find_or_create_by_rt_id(name:actor["name"], rt_id:actor["id"])
        actor["characters"].nil? ? characters = [nil] : characters = actor["characters"]
        characters.each do |character|
          if Character.where(movie_id:new_movie.id, actor_id:new_actor.id, name:character).empty?
            Character.create(movie_id:new_movie.id, actor_id:new_actor.id, name:character)
          end
        end
      end
    end
  end

  def Movie.get_movies
    ["box_office", "in_theaters", "opening", "upcoming"].each do |kind|
      result = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/#{kind}.json?apikey=#{ENV['WATCHR_RT_KEY']}")
      if kind == "in_theaters" || kind == "upcoming"
        ((result["total"].to_f/50.00).ceil.to_i).times do |page|
          r = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/#{kind}.json?page_limit=50&page=#{page+1}&country=us&apikey=#{ENV['WATCHR_RT_KEY']}")
          begin
            Movie.create_movies(r["movies"], kind)
          rescue
          end
        end
      else
        begin
          Movie.create_movies(result["movies"], kind)
        rescue
        end
      end
    end
  end
end
