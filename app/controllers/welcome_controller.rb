class WelcomeController < ApplicationController
before_filter CASClient::Frameworks::Rails::Filter
  def index
  end
end
