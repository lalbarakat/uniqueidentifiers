# Load the rails application
require File.expand_path('../application', __FILE__)
#cas
#require 'casclient'
#require 'casclient/frameworks/rails/filter'
# Initialize the rails application
Uniqueidentifiers::Application.initialize!

#CASClient::Frameworks::Rails::Filter.configure(
#      :cas_base_url => "https://cas.tamu.edu/"
#    )
