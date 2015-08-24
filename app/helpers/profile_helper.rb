module ProfileHelper

  def render_action_bar

  end

  def render_friendship_bar
    if @user.uuid == current_user.uuid
        link_to 'Thats you', root_path
    else
      if !Friendship.find_by_user_id_and_friend_id(current_user.id, @user.id).blank?
        link_to t('buttons.profile.cancel_friend_request'), root_path
      elsif !Friendship.find_by_user_id_and_friend_id(@user.id, current_user.id).blank?
        link_to t('buttons.profile.answer_friend_request'), root_path
      else
        link_to  t('buttons.profile.add_friend'), add_friend_path
      end
    end
  end

  def render_follow_bar
    if @user.uuid == current_user.uuid
      link_to 'Thats you', root_path
    else
      if current_user.follows?(@user)
        link_to t('buttons.profile.social.follow.unfollow'), toggle_follow_user_path
      else
        link_to  t('buttons.profile.social.follow.follow'), toggle_follow_user_path
      end
    end
  end

  def render_follower_count

    link_to @user.followers(User).count, root_path
  end
end
