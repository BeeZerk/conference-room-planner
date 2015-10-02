# == Schema Information
#
# Table name: events_members
#
#  id        :integer          not null, primary key
#  event_id  :integer          not null
#  member_id :integer          not null
#  admin     :boolean          default(FALSE)
#

require 'test_helper'

class EventsMemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
