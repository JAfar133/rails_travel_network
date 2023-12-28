class HomeController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    if user_signed_in?
      redirect_to root_path  
    else
      redirect_to new_user_session_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
