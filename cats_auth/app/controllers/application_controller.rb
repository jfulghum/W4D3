class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    # debugger
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)

    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    @current_user = nil
    session[:session_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def not_logged_in?
    @current_user.nil?
  end


  def ensure_logged_in
    unless logged_in?
      flash[:errors] = ['Please login']
      redirect_to new_session_url
    end

  end

end
