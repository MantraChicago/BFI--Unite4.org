#= require_tree .


$(document).ready ->
  $("#cities_nav").click (e) ->
    $("#selectcity").addClass "active"
    $("#selectcause").removeClass "active"
    e.stopPropagation()

  $("#causes_nav").click (e) ->
    $("#selectcause").addClass "active"
    $("#selectcity").removeClass "active"
    e.stopPropagation()

  $("body").click (e)->
    $target = $(e.currentTarget)

    $("#selectcity,#selectcause").removeClass "active"
