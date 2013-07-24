Application.profiles={}
Application.profiles.index=function(){
  load_profile_map()
}

Application.profiles.show = function(){
  load_profile_map()
}

var load_profile_map=function(){
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