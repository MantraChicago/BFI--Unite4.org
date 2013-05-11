// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

(function($) {
    //custom functions
    
    $.fn.fadeSlideUp = function(){
	var height = $(this).outerHeight();	
	$(this).animate({
	    'top':'-=' + height + 'px'
	},200);
    }
    
    $.fn.fadeSlideIn = function(){
	$(this).each(function(){
	    var left = parseInt($(this).css('left'));
	    
	    $(this).css({
		'opacity':0,
		left: left+80+'px'
		}).animate({
		'left':left+'px',
		'opacity':1
	    });	    
	})

	
    }
    
    $(document).ready(function(){
	$('.cascade .cascade-single').css('opacity',0).each(function(i){
	    $(this).delay(i*50+100).animate({
		'opacity':1
	    });
	});
	$('.notice-close').click(function(){
	    
	    $(this).parents('.upper-notice').fadeSlideUp();
	});
	
	$('.home-tiles-container .home-tiles-group').isotope({
	    itemSelector: '.home-tile-single',	
	    animationEngine: 'jquery',
	    layoutMode: 'masonryHorizontal',
	    masonryHorizontal: {
		rowHeight: 16
	    },
	    animationOptions: {
		duration: 750,
		easing:'easeOutExpo'
	    }
	//when done
	}).promise().done(function(){
	    $(this).css('overflow','visible');
	    $('.home-tile-single',this).each(function(i){
		$(this).delay(i*60+400).fadeSlideIn();
	    })
	});		
	
	
    });
})(jQuery);