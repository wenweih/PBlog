class Comment < ApplicationRecord
  belongs_to :post

  default_scope { order(created_at: :desc) }

  validates :name, presence: true
  validates :email, presence: true
  validates :content, presence: true
end
