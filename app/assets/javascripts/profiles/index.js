Application.profiles={}
Application.profiles.index=function(){
  $.get('/api/v1/users/followed_causes_locations',function(data){
    causes=[]
    _(data).each(function(row){
      causes.push(row.followed_causes_locations)
    })
    causes=_(causes).flatten()
    console.log(causes)
    var map_view=new MapView({el:$('#user_map'),
                            causes: causes})


  })
}