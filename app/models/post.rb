# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  votes      :integer          default(0)
#  kind       :string(255)
#  party_id   :string(255)
#  movie_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  posted_at  :datetime
#  popularity :integer
#  likes      :integer
#  comments   :integer
#  shares     :integer
#

class Post < ActiveRecord::Base
  attr_accessible :content, :kind, :party_id, :votes, :posted_at, :popularity, :likes, :comments, :shares
  belongs_to :movie

  def Post.create_facebook_posts(posts, movie)
    #do more to figure out what kind of post it is, and save pictures?
    posts.each do |post|
      from = post["from"]
      puts from unless from["category"].nil?
      if from["category"] == "Movie" || from["category"] == "Studio"
        if !post["message"].nil? && post["message"].include?("http://")
          puts "working on post from #{from}..."
          puts
          message = post["message"].gsub(/http:\/\/\S+/, '<a href="\0" target="_blank">\0</a>')
          post["likes"].nil? ? likes = 0 : likes = post["likes"]["data"].length
          post["comments"].nil? ? comments = 0 : comments = post["comments"]["data"].length
          post["shares"].nil? ? shares = 0 : shares = post["shares"]["count"]
          new_post = Post.find_or_create_by_party_id(party_id:post["id"], content:message, kind:"facebook", likes:likes, comments:comments, shares:shares, popularity:(likes*2+comments*5+shares*10), posted_at:post["updated_time"].to_datetime)
          movie.posts << new_post unless movie.posts.include?(new_post)
        end
      end
    end
  end #create_facebook_posts end

  def Post.get_facebook_posts(movie)
    gen_key = HTTParty.get("https://graph.facebook.com/oauth/access_token?client_id=#{ENV['WATCHR_ID']}&client_secret=#{ENV['WATCHR_SECRET']}&grant_type=client_credentials")
    url = "https://graph.facebook.com/#{movie.fb_id}/feed?#{gen_key}"
    encoded_url = URI.encode(url)
    results = HTTParty.get(encoded_url)
    while results["data"] != []
      url = results["paging"]["next"]
      encoded_url = URI.encode(url)
      Post.create_facebook_posts(results["data"], movie)
      results = HTTParty.get(encoded_url)
    end
  end #get_facebook_posts end


end #class end
