# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  allDay      :boolean
#  start       :datetime         not null
#  end         :datetime         not null
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
