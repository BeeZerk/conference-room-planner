# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.chosen-it').chosen()
	$('#collapse-sidemenu').click ->
		$('body').toggleClass('aside-collapsed')
		return
	$('body.aside-collapsed li').mouseover ->
		alert('lol')
		return