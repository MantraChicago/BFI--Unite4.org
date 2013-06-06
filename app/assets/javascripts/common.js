

(function($) {
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