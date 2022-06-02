class ApplicationController < ActionController::Base
    before_action :authenticate_user!
     
    protect_from_forgery with: :exception
    
    # before_action :configure_permitted_parameters,
    #                if: :devise_controller?

    # protected
    
    # def configure_permitted_parameters
    #     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :avatar) }
    #     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :password, :password_confirmation, :current_password, :avatar) }
    # end
end
