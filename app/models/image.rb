# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#

class Image < ApplicationRecord
  belongs_to :book

  before_destroy do
    File.delete("#{Rails.root}/public/#{self.url}")
  end

end
