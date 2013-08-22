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

  def Movie.get_movies

  end
end
