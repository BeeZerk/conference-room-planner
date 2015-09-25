# == Schema Information
#
# Table name: calendars
#
#  id         :integer          not null, primary key
#  name       :string
#  color      :string
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#

require 'test_helper'

class CalendarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
