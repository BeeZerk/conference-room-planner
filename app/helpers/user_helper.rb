module UserHelper

  def count_unchecked_notifications

    count = Notification.where(user_id: current_user.id, seen: false).count
    if count != 0
      return "<div class=\"label label-danger\">#{count}</div>".html_safe
    end

  end
end