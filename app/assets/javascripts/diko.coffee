# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	$('.day').dblclick ->
		td = $(this)

		overflow = td.find('div.new_overflow')
		$('div.new_overflow').not(overflow).hide()
		bottomTop = td.offset().top - 70
		bottomLeft = td.offset().left + 200
		overflow.css({
			position: 'absolute',
			top: bottomTop,
			left: bottomLeft
		})
		overflow.fadeToggle( "fast")
		$.ajax '/event/new_small',
			type: 'GET'
			success: (data, textStatus, jqXHR) ->
				overflow.html(data)

				return
			error: (jqXHR, textStatus, errorThrown) ->
				alert 'Es ist ein Fehler aufgetreten'
				return
		return
	$('.tile').each (index) ->
		elem = $(this)
		elem.ready ->
			rgbBgColor = elem.css('backgroundColor')
			color = rgbBgColor.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/)
			brightness = 1
			r = color[1]
			g = color[2]
			b = color[3]
			ir = Math.floor((255 - r) * brightness)
			ig = Math.floor((255 - g) * brightness)
			ib = Math.floor((255 - b) * brightness)
			elem.children('.tile-title').css 'color', 'rgb(' + ir + ',' + ig + ',' + ib + ')'
			elem.css 'border', '1px solid rgb(' + ir + ',' + ig + ',' + ib + ')'


			return
		return
	return
