EventTracker={
  track_event:function(event_name, options){
    user_id=App.user.id
    if(!user_id){
      if(!options){
        options={}
      }
      options['name']= event_name
      options['user_id']= user_id
      $.post('/user_event',options)
    }
  }
}