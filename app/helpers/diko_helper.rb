module DikoHelper
  def month_calendar_td_options
    ->(start_date, current_calendar_date) {
      classes = Array.new
      classes << SimpleCalendar::Calendar.new({}).default_td_classes.call(start_date, current_calendar_date)
    }
  end
end
