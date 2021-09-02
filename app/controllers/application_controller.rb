class ApplicationController < ActionController::Base
 before_action :authenticate_user!,except: [:top, :about]

 before_action :configure_permitted_parameters, if: :devise_controller?

 def after_sign_in_path_for(resource)
  user = current_user.id
  if User.exists?(user)
   flash[:notice] = "Signed in successfully."
   user_path(current_user.id)
   else
    flash[:notice] = "Welcome! You have signed up successfully."
    user_path(current_user.id)
   end
 end

 def after_sign_out_path_for(resource)
  flash[:notice] = "Signed out successfully."
  root_path
 end

 protected
 def configure_permitted_parameters
  # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
 end

end
