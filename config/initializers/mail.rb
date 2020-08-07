if Rails.env.production?
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    port: 587,
    address: 'smtp.gmail.com',
    user_name: ENV["SMTP_USERNAME"],
    password: ENV["SMTP_PASSWORD"],
    authentication: 'plain',
    enable_starttls_auto: true
  }
elsif Rails.env.development?
  config.action_mailer.delivery_method = :letter_opener
else
  config.action_mailer.delivery_method = :test
end