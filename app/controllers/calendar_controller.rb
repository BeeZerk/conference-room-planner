class CalendarController < ApplicationController

  before_action :authenticate_user!
  before_action :get_calendar

  def month
    @events = Event.where(:calendar => @calendar)
  end

  private
  def get_calendar
    @calendar = Calendar.find_by_token(params[:token])
    if @calendar.nil?
      redirect_to cuboise_start_page_path, alert: t('invalid_calendar')
    end
  end
end
