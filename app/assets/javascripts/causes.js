

//= require libs/underscore-min.js
//= require libs/backbone-min.js

var Cause= Backbone.Model.extend({
    name:'Cause'
})

var Location= Backbone.Model.extend({
    name:'Location'
})
/*
var Need= Backbone.Model.extend({
    name:'Need'
})
*/

var FilterView=Backbone.View.extend({
	initialize:function(){
		this.render()
	},
	events:{'click .filter':'filter'},
	render:function(){
		var template=$(_.template($('#filter-template').html(),{}))

    for(var i in this.options.causesCollection.models){
        var cause= this.options.causesCollection.models[i]
        template.find('.causeHolder').append('<div><a data-id="'+cause.id+'" data-type="causeCollection" class="filter">'+cause.get('name')+'</a></div>')
    }

		$(this.el).html(template)
	},

  filter:function(){
    clearMapOverlays()
    var id = $(this).attr('data-id')
    var type = $(this).attr('data-type')
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

var populateMapMarkers=function(map,locations){
	clearMapOverlays()
	for(var j in locations){
		var location = locations[j]
		var myLatlng = new google.maps.LatLng(location.get('latitude'),location.get('longitude'))
        var cause=causesCollection.get(location.get('cause_id'))

        var marker = new google.maps.Marker({
              position: myLatlng,
              map: map,
              title: location.get('name'),
              user_content: location.get('name')+'<br/><a href="/causes/'+location.get('cause_id')+'">'+cause.get('name')+'</a>'
            });
        markersArray.push(marker)
        
        google.maps.event.addListener(marker, 'click', function() {
            var self=this
            var infowindow = new google.maps.InfoWindow({
                content:self.user_content
            });

          infowindow.open(map,this);
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
