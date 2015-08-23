module ProfileHelper
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
end
