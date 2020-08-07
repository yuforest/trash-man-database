if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.action_mailer.raise_delivery_errors = true
  ActionMailer::Base.action_mailer.smtp_settings = {
    port: 587,
    address: 'smtp.gmail.com',
    user_name: ENV["SMTP_USERNAME"],
    password: ENV["SMTP_PASSWORD"],
    authentication: 'plain',
    enable_starttls_auto: true
  }
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :letter_opener
else
  ActionMailer::Base.delivery_method = :test
end