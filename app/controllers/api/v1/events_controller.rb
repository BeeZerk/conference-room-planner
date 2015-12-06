class Api::V1::EventsController < Api::BaseController

  def create_fast

    if params['day'].blank? || params['time'].blank? || params['subject'].blank?
      return api_v1_response_missing_parameters
    end

    Event.create(
             title: params['subject'],
             allDay: false,
             start: date_of_next("#{params['day']} #{params['time']}"),
             end: date_of_next("#{params['day']} #{params['time']}"),
             creator: current_user
    )
    render json: {}, status: 200
  end


  private
  def date_of_next(day)
    date  = DateTime.parse(day)
    delta = date > DateTime.now ? 0 : 7
    date + delta
  end
end
