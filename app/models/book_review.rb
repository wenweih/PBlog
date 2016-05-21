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

class BookReview < Post
end
