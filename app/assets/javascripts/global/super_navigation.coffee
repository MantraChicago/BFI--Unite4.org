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
