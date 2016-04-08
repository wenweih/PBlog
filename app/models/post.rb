class Post < ActiveRecord::Base

  extend FriendlyId
  include Redis::Objects

  validates :title, presence: true
  validates :content, presence: true
  validates :friend_url,presence: true,uniqueness: true
  belongs_to :user,class_name: "User"

  counter :hits, default: 0

  acts_as_taggable_on :tags
  friendly_id :friend_url, :use => :slugged

  def content_html
    self.content
  end

  def sub_content
     HTML_Truncator.truncate(content_html, 200, length_in_chars: true)
   end
end
