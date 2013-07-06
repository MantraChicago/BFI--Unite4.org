#= require_tree .


$(document).ready ->
  $("#cities_nav").click (e) ->
    $("#selectcity").addClass "active"
    e.stopPropagation()

  $("body").click ->
    $("#selectcity").removeClass "active"    

  $("#selectcity").click (e) ->    
    e.stopPropagation()
