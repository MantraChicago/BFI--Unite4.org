Application.header={
	popover_open:false,
	popover_time:300,
	open_nav:function(type){
		var element=$('<div class="header_popover_holder"><div class="header_popover"></div></div>');
		$('#topbar').after(element);
		var popover=element.find('.header_popover')
		popover.animate({
			top:0
		},this.popover_time)
		this.popover_open=type
		return popover
	},

	close_nav:function(callback){
		var self =this
		$('.header_popover').animate({
			top:-800
		},this.popover_time,function(){
			$(this).remove()
			self.popover_open=false
			if(callback){
				callback()
			}
			
		})
	},

	toggle_nav:function(html,popover_type){
		var self =this
		if(this.popover_open == popover_type){
			this.close_nav()
		}if(this.popover_open==false){
			var popover = this.open_nav(popover_type)
			popover.html(html)
		}else{
			this.close_nav(function(){
				var popover = self.open_nav(popover_type)
				popover.html(html)
			})
			
			
		}
		
	}

}
setupHeader=function(){
	/*
	var cities_html=JST['templates/header_cities_dropdown']({cities:Application.data.cities})
	
	var causes_html=JST['templates/header_causes_dropdown']( {cause_types:Application.data.cause_types} )

	$('#cities_nav').click(function(){
		$(this).addClass('active')
		Application.header.toggle_nav(cities_html,'cities')
	});


	$('#causes_nav').click(function(){
		Application.header.toggle_nav(causes_html, 'causes')
	});
	*/
	$('#login_button').click(function(event){
		event.preventDefault();
		Application.show_login_modal()
	})
	$('.popover_tigger').click(function(){
		$('.profile_drop_down ul').toggleClass('hide')
	})
}
