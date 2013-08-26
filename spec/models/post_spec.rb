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

require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end
