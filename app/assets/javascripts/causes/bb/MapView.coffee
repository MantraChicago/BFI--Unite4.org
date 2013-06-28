BFI.MapView = Backbone.View.extend

  focusMap: (lat, long) ->
    #TODO: THIS IS HARDCODED UNTIL LAT/LONG AVAILABLE ON CAUSE
    @map.setView([41.85, -87.70], 13)

  render: () ->
    @createMap()
    return @

  #create the map data w/ initial settings
  createMapData: () ->
    new L.tileLayer(
      '''http://{s}.tile.cloudmade.com/
         e6b28fa129d84b298c65c9fc758be34b/
         997/
         256/
         {z}/{x}/{y}.png'''
      , {
          attribution: 'cloudmade'
          zoomControl: false
      }
    )

  #create our map object and attach it to node id='map'
  createMap: (domNode) ->
    @map = new L.map('map')
      .setView([41.87, -87.65], 13)
      .addLayer(@createMapData())

  #create a marker given lat/long/name
  createMarker: (lat, long, name) ->
    new L.Marker(
      [lat, long],
      {
        title: name
        zIndexOffset: 5
        riseOnHover: true
      }
    )

  #observer that re-creates markers whenever causes change
  placeMarkers: (causes) ->
    #wipe out old markers
    for marker in markers
      @map.removeLayer marker

    ##flush the markers
    @markers = []

    #create new markers
    for cause in causes
      marker = @createMarker(cause.lat, cause.long, cause.name)
      @map.addLayer marker
      
      #add new marker to array for tracking/removal
      @markers.push marker
