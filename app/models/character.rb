# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  movie_id   :integer
#  actor_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Character < ActiveRecord::Base
  attr_accessible :actor_id, :movie_id, :name
end
