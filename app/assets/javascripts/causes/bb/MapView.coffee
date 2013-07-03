BFI.MapView = Backbone.View.extend

  markers: []

  focusMap: (lat, long) ->
    @map.setView([lat, long], 14)

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
  createMap: ->
    if not @map
      @map = new L.map('map')
        .setView([41.87, -87.65], 13)
        .addLayer(@createMapData())

  #called by parent container after elements are in DOM
  afterRender: ->
    @createMap()
    @removeMarkers()
    @placeMarkers()

  #create a marker given lat/long/name
  createMarker: (lat, long, cause) ->
    marker = new L.Marker(
      [lat, long],
      {
        title: cause.attributes.name
        zIndexOffset: 5
        riseOnHover: true
      }
    )
    marker.cause = cause

    #define an onclick behavior here
    #a cause attribute is injected onto each marker and
    #is accessible in markers.target.cause within the event
    #handler
    marker.on('click', (marker) ->
      alert """#{marker.target.cause.attributes.name}\n
               this is a fake placeholder for a modal popup \n
               You can create a real implementation of this modal
               By looking in the createMarker method of MapView."""
    )

  #remove all markers from the map
  removeMarkers: ->
    for marker in @markers
      @map.removeLayer marker
    @markers = []

  #observer that re-creates markers whenever causes change
  placeMarkers: ->
    for cause in @collection.models
      for location in cause.attributes.locations_details
        if location.lat and location.lng
          marker = @createMarker(
            location.lat,
            location.lng,
            cause,
          )
          @map.addLayer marker

          #add new marker to array for tracking/removal
          @markers.push marker
