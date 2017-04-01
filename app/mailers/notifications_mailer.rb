class NotificationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.contact.subject
  #
  def contact contact
    @contact = contact
    mail to: "mr.huangwenwei@gmail.com", subject: 'contact message from homepage'
  end

  def comment comment
    @comment = comment
    mail to: "mr.huangwenwei@gmail.com", subject: "comment from homepage"
  end
end
