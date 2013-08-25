class Post < ActiveRecord::Base
  attr_accessible :content, :kind, :party_id, :votes
  belongs_to :movie
end
