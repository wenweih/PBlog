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

class Post < ApplicationRecord
  extend FriendlyId
  include AASM
  attr_accessor :book_cover_url
  has_one :image, dependent: :destroy
  has_many  :likes, dependent:  :destroy
  has_many  :comments

  validates :title, presence: true
  validates :content, presence: true
  validates :friend_url,presence: true,uniqueness: true
  belongs_to :user,class_name: "User"

  acts_as_taggable_on :tags

  friendly_id :friend_url, :use => :slugged

  default_scope { where(state: 'published').order("created_at desc") }

  after_create do
    cover = Image.create(url: self.book_cover_url)
    self.image = cover
  end

  after_update do
    unless self.book_cover_url.blank?
      if self.image.present? && self.image.url.present?
        File.delete("#{Rails.root}/public#{self.image.url}")
        self.image.update_columns(:url=> "#{self.book_cover_url}")
      else
        cover = Image.create(url: self.book_cover_url)
        self.image = cover
      end
    end
  end

  aasm  :column => :state do
    state :published
    state :unpublished
    event :publish do
      transitions :from => :unpublished,  :to =>  :published
    end
    event :hide  do
      transitions :from => :published,  :to =>  :unpublished
    end
  end

  def content_html
    self.content
  end

  def sub_content
     HTML_Truncator.truncate(content_html, 100, length_in_chars: true)
   end
end
