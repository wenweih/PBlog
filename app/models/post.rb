class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
end
