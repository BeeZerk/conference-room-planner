# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  allDay      :boolean
#  start       :datetime
#  end         :datetime
#  description :text
#  color       :string
#  creator_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
