class Post < ActiveRecord::Base
  extend FriendlyId
  validates :title, presence: true
  validates :content, presence: true
  validates :friend_url,presence: true,uniqueness: true
  belongs_to :user
  acts_as_taggable_on :tags
  friendly_id :friend_url, :use => :slugged
end
