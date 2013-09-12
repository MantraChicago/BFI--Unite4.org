var setupHeader=function(){


	$('#causes_nav').click(function(){
		$('#cause_type_modal').foundation('reveal', 'open')
	});
	
	$('.login_button').click(function(event){
		event.preventDefault();
		Application.show_login_modal()
	})
	$('.profile_drop_down').click(function(){
		$(this).find('ul').toggleClass('hide')
	})
}





  