class ApplicationController < ActionController::Base

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def user_not_authorized
    flash[:alert] = "ban khong phai admin"
    redirect_to(request.referrer || root_path)
  end

  protected
  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :name, :role]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
