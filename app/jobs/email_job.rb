class EmailJob < ApplicationJob
  queue_as :default

  def perform(contact)
    NotificationsMailer.contact(contact).deliver_now
  end
end
