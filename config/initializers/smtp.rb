Mailgun.configure do |config|
  config.api_key = ENV["MAILGUN_API_KEY"]
end

ActionMailer::Base.smtp_settings = {
  :user_name => ENV["SMTP_USERNAME"],
  :password => ENV["SMTP_PASSWORD"],
  :domain => ENV["SMTP_DOMAIN"],
  :address => ENV["SMTP_ADDRESS"],
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true,
  :openssl_verify_mode => :none
}
