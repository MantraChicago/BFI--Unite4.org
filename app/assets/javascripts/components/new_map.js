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
    var html=$(JST['templates/map/map_template']())
    $(this.el).html(html)
    this.map = this.createGoogleMap(html.find('#mapholder')[0])
    locations=this.getLocations()
    //console.log(locations)
    this.populateMapMarkers(locations)
  },
  getLocations:function(){
    var locations
    if(!this.options.locations){
      var locations=_(this.options.causes).reduce(function(array,cause){
        array.push(cause.locations_details)
        _.zip(array,cause.locations_details)
        return array
      },[])
      locations=_(locations).flatten(true)
    }else{
      locations=this.options.locations
    }
    return locations
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
      var myLatlng = new google.maps.LatLng(location.latitude,location.longitude)
      //var cause=causesCollection.get(location.cause_id)
      var marker = new google.maps.Marker({
          position: myLatlng,
          map: this.map,
          title: location.name,
          icon: this.markerIcons.darkblue,
          user_cause_id: location.cause_id
      });
      this.markers.push(marker)
      if(!this.options.disable_marker_clicks){
        google.maps.event.addListener(marker, 'click', function() {
          var self=this;

          $('#myModal').foundation('reveal', 'open', {
              url: '/modals/cause/'+this.user_cause_id
          });
        })
      }
      
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
      var locations = self.options.map_view.getLocations()
      self.options.map_view.populateMapMarkers(locations)
    })
    
  }
})

