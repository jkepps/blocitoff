class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
  	# devise_parameter_sanitizer.for(:sign_up) << :username
  end

  private
  def require_sign_in
  	unless current_user
  		flash[:error] = "You must be logged in to do that"
  		redirect_to new_session_path
  	end
  end
end
