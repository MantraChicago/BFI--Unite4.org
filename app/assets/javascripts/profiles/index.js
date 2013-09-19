Application.profiles={}
Application.profiles.index=function(){
  var is_editing_profile=false

  $('.edit-link').click(function(){
    is_editing_profile=!is_editing_profile
    if(is_editing_profile){
      $(this).html('Done')
      $('.profile-info').hide()
      $('.profile-edit-form').show()
    }else{

      $('.profile_edit_form').submit()
    }
    
  }) 

  $('.profile_change_photo').click(function(){
    $('.change-profile-picture').foundation('reveal', 'open')
  })


}

Application.profiles.show = Application.profiles.index // index is for current_user, show is for any profile
