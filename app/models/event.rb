class Event < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar

  has_and_belongs_to_many :users
  belongs_to :creator, class_name: "User"
  belongs_to :calendar
end
