class Event < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar

  belongs_to :company
end
