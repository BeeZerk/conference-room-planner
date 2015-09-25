# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  type       :string
#  seen       :boolean          default(FALSE)
#  checked    :boolean          default(FALSE)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Notification < ActiveRecord::Base
  has_one :user
  enum type: %w(friend_request message)
end
