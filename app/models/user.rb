class User < ActiveRecord::Base
  include Clearance::User
  has_many :posts, dependent: :destroy
end
