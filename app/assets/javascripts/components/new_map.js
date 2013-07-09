var MapView=Backbone.View.extend({
  markers:[],
  markerIcons: {
    darkblue:'/assets/ui/map/marker-dblue.png',
    another:'/assets/ui/map/marker-dblue.png'
  },
  initialize:function(){
    this.markers=[]
    this.render()
  },render: function(){
    var html=$(JST['templates/map/map_template'])
   //console.log(this.el)
    if(!this.map){
      this.map = this.createGoogleMap(html.find('#mapholder')[0])
    }
    var locations=_(this.options.causes).reduce(function(array,cause){
      array.push(cause.locations_details)
      _.zip(array,cause.locations_details)
      return array
    },[])
    locations=_(locations).flatten(true)

    this.populateMapMarkers(locations)
    //$(this.el).html(html)
    
  },
  createGoogleMap:function(element){
    var mapOptions = {
      center: new google.maps.LatLng(41.85, -87.65),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: false 
        };
    this.map = new google.maps.Map(element,mapOptions);

    
    return this.map
  },
  clearMapOverlays:function() {
    for (var i = 0; i < this.markers.length; i++ ) {
      this.markers[i].setMap(null);
    }
    this.markers= [];
  },
  populateMapMarkers:function(locations){
    this.clearMapOverlays();
    for(var j in locations){
      var location = locations[j]
      var myLatlng = new google.maps.LatLng(location.lat,location.lng)
      //var cause=causesCollection.get(location.cause_id)
      var marker = new google.maps.Marker({
          position: myLatlng,
          map: this.map,
          title: location.name,
          icon: markerIcons.darkblue,
          user_cause_id: location.cause_id
      });
      this.markers.push(marker)

      google.maps.event.addListener(marker, 'click', function() {
        var self=this;
        alert('cause: '+this.user_cause_id)
      })
    }
      

  }
})

var MapFilterView=Backbone.View.extend({
  initialize:function(){
    this.render()
  },
  events:{
    'change select':'change'
  },
  render: function(){
    var html=$(JST['templates/map/map_filter_template']({cause_types:this.options.cause_types,
                                                         cities:this.options.cities}))
    $(this.el).html(html)
    
  },
  change:function(event){
    var self=this
    var queryString=''

    $(this.el).find('select').each(function(index,element){
      var val = $(element).val()
      var name = $(element).attr('name')
      if(val !='all'){
        queryString+='&'+name+'='+val
      }
    })
    var url='/api/v1/causes/details/?'+queryString

    $.get(url,function(data){
      self.options.map_view.options.causes=data
      self.options.map_view.render()
    })
    
  }
})

