class Api::BaseController < ActionController::Metal
  include AbstractController::Rendering
  include ActionView::Rendering
  include ActionController::Rendering
  include ActionController::Renderers::All
  include AbstractController::Callbacks
  include AbstractController::Helpers
  include Devise::Controllers::Helpers

  USER, PASSWORD = 'dhh', 'secret'


  protected
  def authentication_check
    http_basic_authenticate_with do |user, password|
      user == USER && password == PASSWORD
    end
  end


  #### Status

  def api_v1_response_missing_parameters
    render json: { exception: 'MissingParameters', status: 400}, status: 400
  end

end
