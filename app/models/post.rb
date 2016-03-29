class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  acts_as_taggable_on :tags
end
