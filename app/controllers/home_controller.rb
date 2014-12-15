class HomeController < ApplicationController
#=begin
  before_filter CASClient::Frameworks::Rails::Filter
  def index
#    @user = session[:cas]
    @username = session[:cas_user]
  end

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
#=end
end
