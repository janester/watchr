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

require 'spec_helper'

describe Following do
  pending "add some examples to (or delete) #{__FILE__}"
end
