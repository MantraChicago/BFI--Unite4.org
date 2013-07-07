$.fn.sameHeight() = ->
  $(this).each ->
    t = $(this)
    height = t.height()
    siblings = t.siblings()
    siblings.each ->
      $(this).height height  if $(this).height < height