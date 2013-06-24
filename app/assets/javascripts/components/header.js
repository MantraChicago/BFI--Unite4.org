Application.header={open_nav:function(){
	var element=$('<div class="header_popover_holder"><div class="header_popover"></div></div>');
	$('#topbar').after(element);
	var popover=element.find('.header_popover')
	popover.animate({
		top:0
	},500)
	return popover
	},

	open_cities_nav:function(){
		var popover = this.open_nav()
		popover.html(JST['templates/header_cities_dropdown']())
	}

}


$('#causes_nav').click(function(){
	Application.header.open_cities_nav()
});