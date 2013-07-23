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

  $('.index-seach').submit(function(event){
    event.preventDefault();
    var url="/charities-supporting-"+$(this).find('#cause_type_cause').val()+'?has_need='+$(this).find('[name="has_need"]').val()
    window.location=url
  })
}