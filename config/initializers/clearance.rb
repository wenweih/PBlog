Clearance::PasswordsController.layout 'layouts/clearance'
Clearance::SessionsController.layout 'layouts/clearance'
Clearance::UsersController.layout 'layouts/clearance'

Clearance.configure do |config|
  config.mailer_sender = "reply@example.com"
end
