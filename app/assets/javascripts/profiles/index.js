Application.profiles={}
Application.profiles.index=function(){
  $.get('/api/v1/causes/details',function(data){
    var map_view=new MapView({el:$('#user_map'),
                            causes: data})


  })
}