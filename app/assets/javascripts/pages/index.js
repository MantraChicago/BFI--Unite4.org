Application.pages={}
Application.pages.index=function(){
  $.get('/api/v1/causes/details',function(data){
    var map_view=new MapView({el:$('#home_map'),
                            causes: data})

    var element = $('<div>')
    $('#mapholder').append(element)
    var map_filter_view=new MapFilterView({el:element,
    								map_view:map_view,
									cause_types:Application.data.cause_types,
									cities:Application.data.cities})
	
  })

  $('.featured_cause_switcher').click(function(event){
    $('.featured_cause_switcher').removeClass('bold')
    $(this).addClass('bold')
    var cause_name= $(this).attr('data-type-name')
    $('.featured_cause_holder').hide()
    $('.featured_cause_holder[data-type-name="'+cause_name+'"]').show()

  })
  $('.featured_cause_switcher:first-child').click()

  $('.header-slide').css('left',0)

}
