@PlanetaryEvents =
	times:
		timeRegex: /^(0?[1-9]|1[012])(:[0-5]\d)?[APap][mM]$/
		days: [
			'monday'
			'tuesday'
			'wednesday'
			'thursday'
			'friday'
			'saturday'
			'sunday'
		]

		get_day_from_query: (string) ->
			if jQuery.inArray(string.toLowerCase(), PlanetaryEvents.times.days) != -1
				day = string
			else
				day = "today"
			return day

		get_time_from_query: (string) ->
			if PlanetaryEvents.times.timeRegex.test(string)
				time = string
				console.log 'found something'
			else
				hours = new Date().getHours() + 1
				hours = (hours+24-2)%24
				mid='am'
				if(hours==0)
					hours=12
				else if(hours>12)
					hours = hours%12
					mid='pm'
				time = hours + mid
			return time
