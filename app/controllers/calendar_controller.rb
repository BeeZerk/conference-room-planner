class CalendarController < ApplicationController

  before_action :authenticate_user!
  before_action :get_calendar, only: [:month]





  ######################################################
  ###################### Default
  ######################################################

  def index
    @calendars = Calendar.where(:owner => current_user)
  end


  def ajax_get_events
    render json: Event.all
  end

  ######################################################
  ###################### Form Methods
  ######################################################

  def fast_create
    @new_calendar = Calendar.new(calendar_params)
    @new_calendar.owner_id = current_user.id
    if @new_calendar.save


      redirect_to calendar_path
    else
      render :index
    end
  end



  def month
    @events = Event.where(:calendar => @calendar)
  end



  private
  def get_calendar
    @calendar = Calendar.find_by_token(params[:token])
    if @calendar.nil?
      redirect_to calendar_path, alert: t('invalid_calendar')
    end
  end


  def calendar_params
    params.require(:calendar).permit(:name, :color)
  end
end
