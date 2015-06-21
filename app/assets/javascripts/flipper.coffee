$(document).ready ->
  btnClicked = false
  $('.card.effect__click').click ->
    if btnClicked == false
      c = $(this)
      if c.hasClass('flipped') == false then c.addClass('flipped')
    else
      btnClicked = false
    return
  $('.btn.effect__click__close').click ->
    c = $(this)
    closest = c.closest('.effect__click')
    if c.closest('.effect__click').hasClass('flipped') == true then closest.removeClass('flipped')
    btnClicked = true
    return
  return