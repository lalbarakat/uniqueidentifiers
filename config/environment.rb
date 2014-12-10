# Load the rails application
require File.expand_path('../application', __FILE__)
#cas
# Initialize the rails application
Uniqueidentifiers::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'ejn8411',
  :password => 'dWalk606',
  :domain => 'https://uniqueidentifiers.herokuapp.com/',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

# Basic CAS client configuration
#   require 'casclient'
#   require 'casclient/frameworks/rails/filter'
#   CASClient::Frameworks::Rails::Filter.configure(
#   :cas_base_url => "https://cas-dev.tamu.edu/"
#)
