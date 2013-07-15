Application.show_login_modal=function(message){
  $('body').prepend('<div id="login_modal" class="reveal-modal small"></div>')

  $('#login_modal').foundation('reveal', 'open', {
    url: '/modals/login',
    success: function(data) {
      //hack
      setTimeout(function(){
        $('#login_modal .message').html(message)
      },100)
      
       
    },
    closed: function(){
      $('#login_modal').remove()
    }
  });

  
}