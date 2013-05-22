

//= require libs/underscore-min.js
//= require libs/backbone-min.js

var Cause= Backbone.Model.extend({
    name:'Cause'
})

var Location= Backbone.Model.extend({
    name:'Location'
})

$(document).ready(function(){
    windowhtml = $('#cause-single-window').html();
    $('#cause-single-window').html('');
})


var CauseView = Backbone.View.extend({
    initialize:function(){
	this.render()
    },
    render:function(){
	var html =_.template($('#cause_template').html(),this.model.attributes)
	$(this.el).html(html)
    }
})

var FilterView=Backbone.View.extend({
    initialize:function(){
	this.render()
    },
    events:{
	'click .filter':'filter',
	'click .showAll': 'showAll'
    },
    render:function(){
	var template=$(_.template($('#filter-template').html(),{}))

	for(var name in this.options.filterOptions){
	    var collection=this.options.filterOptions[name].collection
	    var html=$(_.template($('#filter-header-row-template').html(),{
		name:name
	    }))
	    for(var i in collection.models){
		var model = collection.models[i]
		html.find('.filterHolder').append(_.template($('#filter-row-template').html(),{
		    type:name,
		    id:model.id,
		    name:model.get('name')
		}))
          
	    }
	    template.find('.filterTypeHolder').append(html)
	}

	$(this.el).html(template)
    },

    showAll:function(){
	clearMapOverlays()
	populateMapMarkers(map,this.options.locationsCollection.models)

    },

    filter:function(event){
	var self=this
	clearMapOverlays()
	var id = $(event.target).attr('data-id')
	var type = $(event.target).attr('data-type')
	var filterOption=this.options.filterOptions[type]
    
	var locations = this.options.locationsCollection.filter(function(model){
	    return filterOption.filterFunction(model,id)
	}) 
	populateMapMarkers(map,locations)
    }
})

var createGoogleMap=function(element){

    var mapOptions = {
	center: new google.maps.LatLng(41.85, -87.65),
	zoom: 6,
	mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(element,
	mapOptions);
	
    return map
}

var parseObjIntoModels=function(dataObj,model){
    var Collection = Backbone.Collection.extend({
	model:model
    })
    var collection=new Collection()

    for(var i in dataObj){
	var obj = dataObj[i]
	var newModel = new model(obj)
	collection.add(newModel)
    }

    return collection

}

var markersArray=[]
var markerIcons = {
    darkblue:'/assets/ui/map/marker-dblue.png',
    another:'/assets/ui/map/marker-dblue.png'
} 
var lastOpenedWindow;
var populateMapMarkers=function(map,locations){
   
    clearMapOverlays();
    for(var j in locations){
	var location = locations[j]
	var myLatlng = new google.maps.LatLng(location.get('latitude'),location.get('longitude'))
	var cause=causesCollection.get(location.get('cause_id'))

	var marker = new google.maps.Marker({
	    position: myLatlng,
	    map: map,
	    title: location.get('name'),
	    icon: markerIcons.darkblue,
	    user_cause_id: cause.id
	});
	markersArray.push(marker)
        
	google.maps.event.addListener(marker, 'click', function() {
	    var self=this;
	    
            


	    var element =$('<div></div>')
	    var causeView= new CauseView({
		el: element,
		model: causesCollection.get(self.user_cause_id)
		})

	    //$('.popoverHolder').append(element)
             
	    var myOptions = {
		content: element.html()
		,
		disableAutoPan: false
		,
		boxClass : 'map-infobox'                
		,
		pixelOffset: new google.maps.Size(-40, 0)               
		,
		closeBoxMargin: "10px 2px 2px 2px"
		,
		closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif"
		//,infoBoxClearance: new google.maps.Size(1, 1)                
		,
		pane: "floatPane"
		
                
	    };

	    if (lastOpenedWindow) {
		lastOpenedWindow.close();
	    } 
	    var ib = new InfoBox(myOptions);
	    lastOpenedWindow = ib;
	    
	    ib.open(map, marker);
	    google.maps.event.addListener(ib, 'domready', function() {
	     $('.map-infobox').prependTo('body').promise().done(function(){
		 $(window).trigger('resize');
	     });	     
	    } )
	    

	/*var infowindow = new google.maps.InfoWindow({
                content:self.user_content
            });

          infowindow.open(map,this);*/
	});
	    
    }


}

var clearMapOverlays=function() {
    for (var i = 0; i < markersArray.length; i++ ) {
	markersArray[i].setMap(null);
    }
    markersArray = [];
}

var combineArrays=function(){
    var retArray=[]
    for( i in arguments){
	var array = arguments[i]
	for(var j in array){
	    var obj = array[j]
	    retArray.push(obj)
	}
		
		
    }
    return retArray
}
