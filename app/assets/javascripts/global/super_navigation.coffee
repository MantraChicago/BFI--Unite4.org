Application.setupSuperNavElements = ->
  $('#selectcity,#selectcause').hide()

  $("#cities_nav").click (e) ->
    $("#selectcity").show().addClass "active"
    $("#selectcause").hide().removeClass "active"
    e.stopPropagation()

  $("#causes_nav").click (e) ->
    $("#selectcause").show().addClass "active"
    $("#selectcity").hide().removeClass "active"
    e.stopPropagation()

  $("body").click (e)->
    $target = $(e.currentTarget)

    $("#selectcity,#selectcause").hide().removeClass "active"
