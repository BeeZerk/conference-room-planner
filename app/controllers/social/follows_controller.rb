class Social::FollowsController <  ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  #####
  ### Only user can follow users
  #####
  def toggle_follow
    if current_user.id != @user.id
      current_user.toggle_follow!(@user)
    end
    redirect_to :back
  end


  private
  def set_user
    @user = User.friendly.find(params[:slug])
    if @user.blank?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end