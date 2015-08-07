class SessionsController < Devise::SessionsController

  ##################################################
  #####            DEFAULT ACTIONS             #####
  ##################################################

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    if resource.active
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      redirect_to root_path, alert: t('devise.failure.inactive')
    end
  end

end