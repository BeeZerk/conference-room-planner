$(document).ready ->
  $('#calendar').fullCalendar
    firstDay: 1
    header:
      left: 'title'
      center: ''
      right: 'today prev,next'
    eventSources: [ {
      url: '/calendar/ajax_get_events'
      type: 'POST'
      data:
        custom_param1: 'something'
        custom_param2: 'somethingelse'
      error: ->
        alert 'there was an error while fetching events!'
        return
      color: 'yellow'
      textColor: 'black'
    } ]
  return
