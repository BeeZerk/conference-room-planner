module SessionsHelper

  ##################################################
  #####            PRIVATE METHODS             #####
  ##################################################

  private

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_stored_location
    session[:return_to] = nil
  end

end