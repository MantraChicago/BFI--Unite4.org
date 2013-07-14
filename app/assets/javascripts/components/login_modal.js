Application.show_login_modal=function(){
  $('body').prepend('<div id="login_modal" class="reveal-modal small"></div>')

  $('#login_modal').foundation('reveal', 'open', {
    url: '/modals/login',
    success: function(data) {
      //hack
      setTimeout(function(){
        console.log($('#login_modal form'))
        $('#login_modal form').submit(function(event){
          //event.preventDefault()
        })   
      },100)
       
    },
    closed: function(){
      $('#login_modal').remove()
    }
  });

  
}