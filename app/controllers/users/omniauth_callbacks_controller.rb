class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    generic_callback( 'facebook' )
  end

  def twitter
    generic_callback( 'twitter' )
  end

  ###TODO: email validation
  def generic_callback( provider )
    @identity = Identity.find_for_oauth env["omniauth.auth"]

    @user = @identity.user || current_user
    if @user.nil?
      @user = User.create( email: @identity.email.nil? ? "" :@identity.email, username: @identity.name.nil? ? "" :@identity.name )
      @identity.update_attribute( :user_id, @user.id )
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute( :email, @identity.email)
    end
    if @user.username.blank? && @identity.name
      @user.update_attribute( :username, @identity.name)
    end
    if @identity.image
      @user.update_attribute( :avatar, @identity.image)
    end

    if @user.persisted?
      @identity.update_attribute( :user_id, @user.id )
      # This is because we've created the user manually, and Device expects a
      # FormUser class (with the validations)
      @user = FormUser.find @user.id
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      if provider == 'twitter'
        session["devise.#{provider}_data"] = env["omniauth.auth"].except('extra')
      else
        session["devise.#{provider}_data"] = env["omniauth.auth"]
      end
      redirect_to new_user_registration_url
    end
  end


end