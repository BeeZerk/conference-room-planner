class Notification < ActiveRecord::Base
  has_one :user
  enum type: %w(friend_request message)
end
