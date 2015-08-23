module UserHelper

  def count_unchecked_notifications
    Notification.where(user_id: current_user.id, seen: false).count
  end
end