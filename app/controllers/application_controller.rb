class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  helper_method :current_user
  def index
    render layout: 'application', text: ''
  end

  def current_user
    @current_user ||= User.find(session[:current_user]) if session[:current_user]
  end

end
