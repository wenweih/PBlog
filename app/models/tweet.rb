# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ActiveRecord::Base
  validates :content, presence: true
end
