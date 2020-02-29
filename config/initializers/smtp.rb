#if you are using the API key
#ActionMailer::Base.smtp_settings = {
#    domain: 'smtp.sendgrid.net',
#    enable_starttls_auto: true,
#    address: "smtp.sendgrid.net",
#    port: 587,
#    authentication: :plain,
#    user_name: "apikey",
#    password: "SG.WhvUA-BXTfWmdQVUmNLMIg.gDQb5XrOfxaBtMXD8gtT1RMfKGhFGUrhpuWGQ_RL"
#}

ActionMailer::Base.smtp_settings = {
  domain: 'smtp.sendgrid.net',
  enable_starttls_auto: true,
  address: "smtp.sendgrid.net",
  port: 587,
  authentication: :login,
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_PASSWORD'],
}
