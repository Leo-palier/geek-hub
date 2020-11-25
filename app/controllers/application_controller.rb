class ApplicationController < ActionController::Base
    before_action :authenticate_user!, :set_user
    def configure_permitted_parameters
        # For additional fields in app/views/devise/registrations/new.html.erb
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    
        # For additional in app/views/devise/registrations/edit.html.erb
        devise_parameter_sanitizer.permit(:account_update, keys: [:username])
      end

       private

  def set_user
    @user = current_user
  end
end
