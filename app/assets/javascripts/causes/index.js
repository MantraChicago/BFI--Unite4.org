if(!Application.causes){
  Application.causes={}
}
Application.causes.index=function(){
  EventTracker.track_event('cause_page_view',{cause_id:Application.data.current_model.id}) 

}