

(function($) {
    
    //this handles class changing with support of next/prev and nav buttons. All animation are supposed to be handled with css3, not js.
    $.fn.quickSlider = function(options) {
	var t = $(this).css('overflow','hidden');
	var defaults = {
	    slides: "quick-slider-single",
	    next: "quick-slider-next",
	    prev: "quick-slider-prev",
	    nav: "quick-slider-nav",
	    autoplay: 5000,
	    hoverpause : true
	};
	options = $.extend({}, defaults, options);
	
	var slides = $('.' + options.slides,t),
	    prev = $('.' + options.prev,t),
	    next = $('.' + options.next,t),
	    nav = $('.' + options.nav,t),
	    interval = 0;
	
	slides.removeClass('active').eq(0).addClass('active');
	nav.removeClass('active').eq(0).addClass('active');
	
	var slide = function(elem) {
	    var index = slides.index(elem);
	    $('.last.' + options.slides,t).removeClass('last');
	    $('.active.' + options.slides,t).addClass('last').removeClass('active');	    
	    
	    $('.active.' + options.nav,t).removeClass('active')
	    $('.' + options.nav,t).eq(index).addClass('active');	    
	    	    
	    elem.addClass('active');
	    
	    clearInterval(interval);
	    autoPlay();	    
	};
	
	prev.click(function(){
	    slide($('.active.' + options.slides,t).prevOrLast('.' + options.slides));
	});
	next.click(function(){
	    slide($('.active.' + options.slides,t).nextOrFirst('.' + options.slides));	    
	});
	
	nav.click(function(){
	    var index = nav.index(this);
	    slide($('.' + options.slides,t).eq(index));
	});
	
	$(document).keydown(function(e){
	    if (e.keyCode == 37) {
		slide($('.active.' + options.slides,t).prevOrLast('.' + options.slides));
	    }
	    if (e.keyCode == 39) { 
		slide($('.active.' + options.slides,t).nextOrFirst('.' + options.slides));
	    }    
	});
	
	var autoPlay = function() {
	    interval = setInterval(function(){
		slide($('.active.' + options.slides,t).nextOrFirst('.' + options.slides));
	    },options.autoplay)
	}
	if ( options.autoplay ) {
	    autoPlay();
	}
	if ( options.hoverpause ) {
	    slides.mouseenter(function(){
		clearInterval(interval);
	    });
	    slides.mouseleave(function(){
		autoPlay();
	    })
	}
    }
    
    
    //custom functions
    $.fn.prevOrLast = function(selector)
    {
	var prev = this.prev(selector);
	return (prev.length) ? prev : this.nextAll(selector).last();
    };

    $.fn.nextOrFirst = function(selector)
    {
	var next = this.next(selector);
	return (next.length) ? next : this.prevAll(selector).last();
    }; 
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

    $.isMobile = function(){
	return !$('.ismobileflag').eq(0).is(':visible');
    }
    
    $.fn.keepRatio = function(ratio) {
	ratio = ratio || $(this).attr('ratio') || 1;
	var t = $(this);
	t.height(t.width/ratio);
	$(window).resize(function(){
	    t.height(t.width/ratio);
	})
    }
    $.fn.tileSlide = function()
    {
	return $(this).each(function(){
	    var elem = $(this);
	    var slides = $('.slide',elem);
		
	    if(slides.length<2) return; 
		
	    var itemH = elem.outerHeight();
		
	    var random = Math.floor(Math.random() * 2000)+1000;	
	    var down = Math.floor(Math.random() * 2);	//		
		
	    var slide = function(down){
				
		var current = $('.slide.current',elem);
		var next = current.nextOrFirst('.slide');
		if ( down ) {
		    current.animate({
			'top':itemH
		    },2000,'easeOutExpo',function(){
			$(this).css({
			    'top':(-1)*itemH
			})
		    }).removeClass('current');
		    next.animate({
			'top':'0px'
		    },2000,'easeOutExpo').addClass('current');
		}	else {
		    current.animate({
			'top':-1*itemH
		    },2000,'easeOutExpo',function(){
			$(this).css({
			    'top':itemH
			})
		    }).removeClass('current');
		    next.animate({
			'top':'0px'
		    },2000,'easeOutExpo').addClass('current');				
		}
	    }
	
	    slides.removeClass('current').eq(0).addClass('current');
		
	    if(down) {
		slides.not('.current').css({
		    'top':(-1)*itemH
		});
	    }
	    else{
		slides.not('.current').css({
		    'top':(1)*itemH
		});
	    }
		
	    setTimeout(function(){		
		slide(down);				
		setInterval(function(){	
				
		    slide(down);
		},4500);
	    },random);	
	});
    };    
    
    
    $.classObjToJQuery = function(classes,dataLabel) {
	var elems = $();
	
	for(var one in classes) {
	    if(classes.hasOwnProperty(one)) {		
		elems = elems.add('.' + one);
		$('.' + one).attr(dataLabel,classes[one])
	    } 
	}
	return elems;	
    }
    
    $.keepRatio = function(classes) {
	
	var setRatio = function(){
	    var elems = $.classObjToJQuery(classes,'ratio');
	    console.log(elems);
	    elems.each(function(){
		var t = $(this);
		var ratio = t.attr('ratio');
	   
		t.attr('ratio',ratio);
		t.height(t.width()/ratio);	    
	    })	    
	}
	setRatio();
	$(window).resize(function(){	    
	    setRatio();
	})

	
    }
    
})(jQuery);