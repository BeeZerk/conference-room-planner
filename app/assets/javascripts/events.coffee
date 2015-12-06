$(document).ready ->
	$('#create_new_fast_event_input').on 'input', (e) ->

		###########################
		## 0 is day
		## 1 time (1am - 12pm)
		##
		eventQueryArray = $(this).val().split /[ ,]+/

		console.log eventQueryArray
		console.log eventQueryArray.length
		if eventQueryArray.length < 3
			$('#create_new_fast_event').prop('disabled', true)
		else
			$('#create_new_fast_event').prop('disabled', false)
		day = PlanetaryEvents.times.get_day_from_query(eventQueryArray[0])

		time = PlanetaryEvents.times.get_time_from_query(eventQueryArray[1])


		$('#create_new_fast_event_input_preview').html(day + time)
		return

	$('#create_new_fast_event').click ->
		eventQueryArray = $('#create_new_fast_event_input').val().split /[ ,]+/
		$.ajax
			url: 'api/v1/events/create/fast'
			dataType: 'json'
			data:
				day: PlanetaryEvents.times.get_day_from_query(eventQueryArray[0])
				time: PlanetaryEvents.times.get_time_from_query(eventQueryArray[1])
				subject: eventQueryArray[2]
			error: (error) ->
				console.log(error)
				return
			success: (data) ->
				console.log(data)
				return
		return
