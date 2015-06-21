$(document).ready ->
  $('.colorpicker').colorpicker().on 'changeColor', (ev) ->
    $('.calendar-form-color-preview').each (index) ->
      elem = $(this)
      elem.css("background-color",  ev.color.toHex())
      return
    return
  while $('.tile span').width() > $('.tile').width()
    $('.tile span').css 'font-size', parseInt($('.tile span').css('font-size')) - 1 + 'px'