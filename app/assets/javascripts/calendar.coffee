$(document).ready ->
  $('#calendar').fullCalendar
    firstDay: 1
    header:
      left: 'title'
      center: ''
      right: 'today prev,next'
    events: (start, end, callback) ->
      $.ajax
        url: '/calendar/ajax_get_events'
        type: 'POST'
        data:
          start_date: start._d,
          end_date: end._d,
        error: ->
          alert 'there was an error while fetching events!'
          return
        color: 'yellow'
        textColor: 'black'
      return
  return
