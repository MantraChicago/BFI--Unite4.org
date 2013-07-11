Application.setupSuperNavElements = ->
  selectCity = $('#selectcity')
  selectCause = $('#selectcause')

  $('#selectcity,#selectcause').hide()

  $("#cities_nav").click (e) ->
    e.stopPropagation()

    if selectCity.is('.active')
      selectCity.hide().removeClass "active"
    else
      selectCity.show().addClass "active"

    selectCause.hide().removeClass "active"

  $("#causes_nav").click (e) ->
    e.stopPropagation()

    if selectCause.is('.active')
      selectCause.hide().removeClass "active"
    else
      selectCause.show().addClass "active"

    selectCity.hide().removeClass "active"

  $("body").click (e)->
    $target = $(e.currentTarget)
    $("#selectcity,#selectcause").hide().removeClass "active"


$(document).ready ->
  if $(".docked").length
    orgFont = parseInt($(".docked .docked-item").css("font-size"))
    orgMargin = parseInt($(".docked .docked-item").css("margin-bottom"))
    $(window).scroll ->
      scrollTop = $(this).scrollTop()
      scrollTop = (if scrollTop > 400 then 400 else scrollTop)
      scrollTop = scrollTop / 400
      modify = 1 - scrollTop
      newZoom = (if modify < 0.1 then 0.1 else 1)
      newMarg = orgMargin * modify
      newMarg = (if newMarg < 20 then 20 else newMarg)
      $(".docked .docked-item").css("margin-bottom", newMarg + "px").css("opacity", newZoom).css "zoom", newZoom

