if(!Application.causes){
	Application.causes={}
}

Application.causes.show=function(){
	$('.middle_bar li').click(function(){
		$('.middle_bar li').removeClass('active')
		$(this).addClass('active')
		var show_element=$('#'+$(this).attr('data-show_id') )
		$('.bar_content').hide()
		show_element.show()
	})
}