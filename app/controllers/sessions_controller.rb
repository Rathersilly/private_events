class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:warning] = "Invalid Credentials"
      render 'new'
    end
    
  end
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end

end
