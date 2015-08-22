class Friendship < ActiveRecord::Base

  belongs_to :users

  validates_uniqueness_of :user_id, :scope => :friend_id

  before_create do
    notification = Notification.new(user_id: self.friend_id)
    notification.type = 'friend_request'
    notification.save!
  end
end
