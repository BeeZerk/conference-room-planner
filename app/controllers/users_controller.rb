class UsersController < ApplicationController
  before_action :authenticate_user!

  ##############################################
  ################ Profile
  ##############################################
  def visit_profile
    @user = User.find_by_slug!(params[:slug])
    if @user.blank?

    end
  end
end
