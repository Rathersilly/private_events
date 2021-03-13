class ApplicationController < ActionController::Base
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      flash[:warning] = "Please log in"
      redirect_to root_url
    end
  end
end
