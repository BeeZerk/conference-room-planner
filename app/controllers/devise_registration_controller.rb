class DeviseRegistrationController < Devise::RegistrationsController
  before_action :update_sanitized_params

  def new
    build_resource({})
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  def create
    build_resource(sign_up_params)
    lol = sign_up_params

    resource.profile = Profile.new(sign_up_params[:profile_attributes])

    # test = resource
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end


  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation,
               :current_password, profile_attributes: [:username])
    end
  end
end