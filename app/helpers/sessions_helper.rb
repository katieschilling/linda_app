module SessionsHelper
  def logged_in?
    session[:logged_in]
  end
end