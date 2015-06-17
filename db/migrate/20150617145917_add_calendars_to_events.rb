class AddCalendarsToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :calendar, references: :calendars, index: true
  end
end
