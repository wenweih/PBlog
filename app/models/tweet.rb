class Tweet < ActiveRecord::Base
  validates :content, presence: true
end
