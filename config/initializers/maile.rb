ActionMailer::Base.delivery_method = :smtp
#Net::SMTP.enable_tls( OpenSSL::SSL::VERIFY_NONE )
  #:enable_starttls_auto => true,
 ActionMailer::Base.smtp_settings = {
    :tls=>true,
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => 'gmail.com',
    :authentication => :login,
    :user_name => "minutemarker@gmail.com",
    :password => "vetri123"
  }

 ActionMailer::Base.default_content_type = "text/html"