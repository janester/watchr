# == Schema Information
#
# Table name: followings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  movie_id   :integer
#  is_watched :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Following < ActiveRecord::Base
  attr_accessible :is_watched, :movie_id, :user_id
end
