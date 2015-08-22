class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: :show

  def show

    lol = @user.twitter
    render 'users/visit_profile'
  end

  private
  def set_user


    @user = User.find_by_uuid(params[:uuid])
    if @user.blank?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
