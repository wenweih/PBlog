# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  message    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ApplicationRecord
  validates :name, :email, :message, presence: true
  validates :email, email: true
  after_create do
    EmailJob.perform_now self
  end
end
