Application.setupSuperNavElements = ->

$(document).ready ->
  if $(".docked").length
    orgFont = parseInt($(".docked .docked-item").css("font-size"))
    orgMargin = parseInt($(".docked .docked-item").css("margin-bottom"))
    $(window).scroll ->
      scrollTop = $(this).scrollTop()
      scrollTop = (if scrollTop > 700 then 700 else scrollTop)
      scrollTop = scrollTop / 700
      modify = 1 - scrollTop
      newZoom = (if modify < 0.1 then 0.1 else 1)
      mediumZoom = (if modify < 0.1 then 0.7 else 1)

      newMarg = orgMargin * modify
      newMarg = (if newMarg < 20 then 20 else newMarg)
      $(".docked .docked-item").css("margin-bottom", newMarg + "px").css("opacity", newZoom).css "zoom", newZoom
      $(".docked-medium").css "zoom", mediumZoom


