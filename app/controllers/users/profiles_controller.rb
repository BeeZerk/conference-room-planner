class Users::ProfilesController < UsersController

  def show
  end

  def show_follower
    @follower = @user.followers(User)
  end

  def show_followees
    @followees = @user.followees(User)
  end


end