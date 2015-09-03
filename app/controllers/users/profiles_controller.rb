class Users::ProfilesController < UsersController
  def show
    render 'users/visit_profile'
  end

  def show_follower
    @follower = @user.followers(User)
  end

  def show_followees
    @followees = @user.followees(User)
  end
end