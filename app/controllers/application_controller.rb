class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!
  before_action :set_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized, except: %i[index show], unless: :devise_controller?
  after_action :verify_policy_scoped, only: %i[index show], unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username, :photo) }

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :photo, :email, :password, :password_confirmation, :current_password) }
  end

  def set_user
    @user = current_user
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
