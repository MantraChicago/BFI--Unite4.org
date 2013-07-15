Application.show_login_modal=function(){
  $('body').prepend('<div id="login_modal" class="reveal-modal small"></div>')

  $('#login_modal').foundation('reveal', 'open', {
    url: '/modals/login',
    success: function(data) {
      //hack
      /*
      setTimeout(function(){
        $('#login_modal form').submit(function(event){
          
          event.preventDefault()
          var user_name= $(this).find('#user_email').val()
          var password= $(this).find('#user_password').val()
          var login_data={
              login:user_name,
              password:password
          }

          $.ajax({
            url: '/users/sign_in.json',
            type: 'POST',
            dataType: 'json',
            data: {user: login_data},
            success: function(data, textStatus, xhr) {
              console.log(data)
              //called when successful
            }
          });

        })   
      },100)
      */
       
    },
    closed: function(){
      $('#login_modal').remove()
    }
  });

  
}