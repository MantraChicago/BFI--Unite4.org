Application.causes ||= {}

Application.causes.show= ->
  EventTracker.track_event('cause_page_view',{cause_id:Application.data.current_model.id}) 
	$('.middle_bar li').click ->
		$('.middle_bar li').removeClass('active')
		$(this).addClass('active')
		show_element=$('#'+$(this).attr('data-show_id') )
		$('.bar_content').hide()
		show_element.show()

