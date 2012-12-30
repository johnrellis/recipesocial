# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mytwitter::Application.initialize!

Mytwitter::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:                  "smtp.gmail.com",
    port:                     587,
    domain:                   "gmail.com",
    authentication:           "plain",
    user_name:                "recipesocial.noreply@gmail.com",
    password:                 "yumyumyum" ,
    enable_startttls_auto:    true
  }
end

