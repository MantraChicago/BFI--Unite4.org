//Active admin is giving a 404 when looking for this file, so I just put it here.

//= require active_admin/base
//= require jquery-ui

var causes_data

$(document).ready(function(){
  $.getJSON('/api/v1/causes/details',function(data){
  causes_data=data
   $('#campaign_cause_id').change(function(){
      hide_noncause_needs($(this).val())
    }).change()
  })

})


var hide_noncause_needs = function(cause_id){
  var cause
  for(var i in causes_data){
    if(causes_data[i].id==cause_id){
      cause = causes_data[i]
    }
  }

  $('#campaign_need_id option').each(function(){
    var hide=true
    for(var i in cause.needs){
      var need=cause.needs[i]
      if(need.id==$(this).attr('value')){
        hide=false
      }
    }
    $(this).attr('disabled',hide)
    
  })
}