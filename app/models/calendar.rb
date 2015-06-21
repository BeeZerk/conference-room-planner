class Calendar < ActiveRecord::Base

  has_and_belongs_to_many :users
  belongs_to :owner, class_name: "User"

  has_many :events

  before_create :generate_unique_calendar_token

  def generate_unique_calendar_token
    self.token = SecureRandom.base64(24)
  end
end
