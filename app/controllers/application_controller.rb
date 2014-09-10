class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  # implemented for improvement for logout with devise
  protect_from_forgery with: :null_session


  # override the default devise login redirect
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
end
