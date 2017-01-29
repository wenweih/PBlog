# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ApplicationRecord
  obfuscate_id :spin => 892387231295436
  validates :content, presence: true
  default_scope { order(created_at: :asc) }
end
