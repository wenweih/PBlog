class EmailJob < ApplicationJob
  queue_as :default

  # type: email type, comment or contact string
  # object: send email object, comment or contact object
  def perform(type, object)
    NotificationsMailer.send(type, object).deliver_now
  end
end
