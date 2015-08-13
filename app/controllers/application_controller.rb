class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  ##################################################
  #####             HELPER MODULES             #####
  ##################################################

  include SessionsHelper

  ##################################################
  #####             HELPER METHODS             #####
  ##################################################

  helper_method :is_admin?

  ##################################################
  #####                 DEVISE                 #####
  ##################################################

  # Customize the Devise after_sign_in_path_for() for redirect to previous page after login.
  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
      when :user, User
        stored_location = session[:return_to]
        clear_stored_location
        stored_location.nil? ? root_path : stored_location.to_s
      else
        super
    end
  end

  ##################################################
  #####             BEFORE ACTIONS             #####
  ##################################################

  before_action :configure_permitted_parameters, if: :devise_controller?

  ##################################################
  #####           PROTECTED METHODS            #####
  ##################################################


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name]
    devise_parameter_sanitizer.for(:sign_up) << [:username, :image]
  end

  def authenticate_user!
    redirect_to new_user_session_path , notice: "You must login" unless user_signed_in?
  end

  def has_profile
    if current_user.profile.blank?
      redirect_to new_profile_path
    end
  end
  ##################################################
  #####            PRIVATE METHODS             #####
  ##################################################

  private

  def admin_permission_required
    if is_admin?
      return true
    else
      redirect_to root_path, alert: t('permission_denied')
    end
  end

  def is_admin?
    user_signed_in? && (current_user.role.name == 'admin')
  end

end
