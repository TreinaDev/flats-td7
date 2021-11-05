if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.perform_deliveries = true

  ActionMailer::Base.smtp_settings = {
    user_name: Rails.application.credentials.mail_user_name,
    password: Rails.application.credentials.mail_secret_key,
    domain: 'yourdomain.com',
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }

  ActionMailer::Base.default_url_options = { host: 'yourdomain.com' }
end