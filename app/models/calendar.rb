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

class Calendar < ActiveRecord::Base

  has_and_belongs_to_many :users
  belongs_to :owner, class_name: "User"

  has_many :events

  before_create :generate_unique_calendar_token

  def generate_unique_calendar_token
    self.token = SecureRandom.base64(24)
  end
end
