class Post < ActiveRecord::Base
  extend FriendlyId
  validates :title, presence: true
  validates :content, presence: true
  validates :friend_url,presence: true,uniqueness: true
  belongs_to :user,class_name: "User"
  acts_as_taggable_on :tags
  friendly_id :friend_url, :use => :slugged

  def content_html
    self.content
  end

  def sub_content
     HTML_Truncator.truncate(content_html, 200, length_in_chars: true)
   end
end
