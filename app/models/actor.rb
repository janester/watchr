# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  rt_id      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Actor < ActiveRecord::Base
  attr_accessible :name, :rt_id
  has_many :characters
  has_many :movies, :through => :characters
end
