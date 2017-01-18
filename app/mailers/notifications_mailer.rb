class NotificationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.contact.subject
  #
  def contact contact
    @contact = contact
    mail to: "mr.huangwenwei@gmail.com", subject: 'contact message', body: @contact.message
  end
end
