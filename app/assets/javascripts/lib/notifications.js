Application.Notifications={
  setupNotifications:function(){
    setTimeout(function(){
      $('.notification_holder').animate(
          {
           opacity: 0, 
         }, 
         'slow',
         function(){
          $(this).remove()
         }
        );
    },10*1000) //10 seconds
  }

}