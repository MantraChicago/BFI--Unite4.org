Application.pages={}
Application.pages.index=function(){
  $.get('/api/v1/causes/details',function(data){
    var map_view=new MapView({el:$('#home_map'),
                            causes: data})
  })
}