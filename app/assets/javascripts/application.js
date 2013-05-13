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
    $.fn.horizontalScroll = function(time,easing)
    {
	var multipler=1;
	
	$(this).mousewheel(function(event, delta) {
	    if ($.isMobile()) {
		return;
	    }    
	    var distance = 4*((-1)*delta * 60);	
	    var scrollTo=$(this).scrollLeft()+multipler*distance;
				
	    scrollTo=scrollTo<0?0:scrollTo;//smoothing scrolling if scrolled to begining of page
	    scrollTo=scrollTo>($(document).width()-$(window).width())?($(document).width()-$(window).width()):scrollTo;//smoothing scrolling if scrolled to end of page	
				
	    $(this).stop().animate({
		'scrollLeft': scrollTo
	    }, time,easing,function(){
		multipler=1
	    });
				
	    multipler+=0.02;
	    multipler=multipler>5?5:multipler;
	    event.preventDefault();
	});
    }
    $.isMobile = function(){
	return !$('.hide-for-small').eq(0).is(':visible');
    }
    
    $.fn.keepRatio = function(ratio) {
	ratio = ratio || $(this).attr('ratio') || 1;
	var t = $(this);
	t.height(t.width/ratio);
	$(window).resize(function(){
	    t.height(t.width/ratio);
	})
    }
    
    $.keepRatio = function(classes) {
	var elems = $();
        
	for(var one in classes) {
	    if(classes.hasOwnProperty(one)) {	
		$('.' + one).attr('ratio',classes[one]);
                elems = elems.add('.' + one);
		//alert(elems.length);
	    } 
	}
        elems.each(function(){
	    var t = $(this);
	    var ratio = t.attr('ratio');
	    
	    t.height(t.width()/ratio);
	    $(window).resize(function(){
		t.height(t.width()/ratio);
	    })
	})
    }
    
    $(document).ready(function(){
	$.keepRatio({
	    'tile-1-1' : 1,
	    'tile-2-2' : 1,
	    'tile-4-4' : 1,
	    'tile-2-1' : 2,
	    'tile-4-2' : 2	    
	})
	$('html,body').horizontalScroll(400,'easeOutQuart');
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