# Load the rails application
require File.expand_path('../application', __FILE__)
#cas
# Initialize the rails application
Uniqueidentifiers::Application.initialize!

# enable detailed CAS logging
# cas_logger = CASClient::Logger.new(::Rails.root+'/log/cas.log')
# cas_logger.level = Logger::DEBUG
#
# CASClient::Frameworks::Rails::Filter.configure(
#   :cas_base_url  => "https://cas.tamu.edu/",
#   :login_url     => "https://cas.tamu.edu/login",
#   :logout_url    => "https://cas.tamu.edu/logout",
#   :validate_url  => "https://cas.example.foo/proxyValidate",
#   :username_session_key => :cas_user,
#   :extra_attributes_session_key => :cas_extra_attributes,
#   :logger => cas_logger,
#   :enable_single_sign_out => true,
#   :service_url => "https://uniqueidentifiers.herokuapp.com/",
#)
