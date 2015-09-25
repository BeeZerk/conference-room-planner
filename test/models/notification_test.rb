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

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
