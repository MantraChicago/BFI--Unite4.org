Application.profiles={}
Application.profiles.index=function(){
  load_profile_map()
}

Application.profiles.show = function(){
  load_profile_map()
}

var load_profile_map=function(){

  var map_view=new MapView({el:$('#user_map'),
                          causes: user_causes})


}