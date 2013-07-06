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


  $("body").click ->
    $("#selectcity,#selectcause").removeClass "active"    

  $("#selectcity,#selectcause").click (e) ->    
    e.stopPropagation()






