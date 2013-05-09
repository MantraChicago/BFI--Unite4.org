

var populateMapMarkers=function(id,causes){
	var mapOptions = {
      center: new google.maps.LatLng(41.85, -87.65),
      zoom: 8,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    //global map
    var map = new google.maps.Map(document.getElementById(id),
        mapOptions);

    for(var i in causes){
    	var cause =causes[i]
    	for(var j in cause.locations){
    		var location = cause.locations[j]
    		var myLatlng = new google.maps.LatLng(location.latitude,location.longitude)
    		var marker = new google.maps.Marker({
		      position: myLatlng,
		      map: map,
		      title: location.name
		    });

    		var infowindow = new google.maps.InfoWindow({
			    content: location.name
			});

		    google.maps.event.addListener(marker, 'click', function() {
			  infowindow.open(map,marker);
			});
    	}
    }
}
