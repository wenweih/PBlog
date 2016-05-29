# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  friend_url :string(255)
#  content    :text(65535)
#  slug       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  type       :string(255)
#

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
     HTML_Truncator.truncate(content_html, 300, length_in_chars: true)
   end
end
