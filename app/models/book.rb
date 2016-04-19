# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  author      :string(255)
#  description :text(65535)
#  recommand   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Book < ActiveRecord::Base

  attr_accessor :book_cover_url

  has_one :image

  validates :name, presence: true
  validates :recommand, presence: true
  validates :description, presence: true

  after_create do
    cover = Image.create(url: self.book_cover_url)
    self.image = cover
  end

  after_update do
    unless self.book_cover_url == ""
      File.delete("#{Rails.root}/public#{self.image.url}")
      self.image.update_columns(:url=> "#{self.book_cover_url}")
    end
  end


end
