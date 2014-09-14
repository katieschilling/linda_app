class SessionsController < ApplicationController
  def new
    redirect_to root_url if session[:logged_in]
  end

  def create
    if valid_login?
      session[:logged_in] = true
      redirect_to root_url
      flash[:success] = "Signed in!"
    else
      flash[:danger] = 'Wrong password'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url
    flash[:success] = "You're now logged out"
  end

  private

  def valid_login?
    params[:login][:username] == ENV['USERNAME'] &&
      params[:login][:password] == ENV['PASSWORD']
  end
end
