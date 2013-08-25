class Post < ActiveRecord::Base
  attr_accessible :content, :kind, :party_id, :votes
  belongs_to :movie

  def Post.create_facebook_posts(posts, movie)
    posts.each do |post|
      from = post["from"]
      if from["category"] == "Movie" || from["category"] == "Studio"
        new_post = Post.find_or_initialize_by_party_id(post["id"])
        new_post.update_attributes(content:post["message"], kind:"facebook")
        movie.posts << new_post
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
      results = HTTParty.get(encoded_url)
      Post.create_facebook_posts(results["data"], movie)
    end
  end #get_facebook_posts end


end #class end
