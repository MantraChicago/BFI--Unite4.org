var Cause= Backbone.Model.extend({
    name:'Cause'
})

var Location= Backbone.Model.extend({
    name:'Location'
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

var populateMapMarkers=function(map,locations){
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
        
        google.maps.event.addListener(marker, 'click', function() {
            var self=this
            var infowindow = new google.maps.InfoWindow({
                content:self.user_content
            });

          infowindow.open(map,this);
        });
        
		

	    
	}


}
