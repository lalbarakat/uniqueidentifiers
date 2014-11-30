class AuthenticatedController < ApplicationController
  before_filter :authorized?
  
  def authorized?
    if !logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end
