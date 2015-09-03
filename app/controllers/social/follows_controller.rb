class Social::FollowsController <  ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  #####
  ### Only user can follow users
  #####
  def toggle_follow
    if current_user.uuid != @user.uuid
      current_user.toggle_follow!(@user)
    end
    redirect_to :back
  end


  private
  def set_user
    @user = User.find_by_uuid(params[:uuid])
    if @user.blank?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end