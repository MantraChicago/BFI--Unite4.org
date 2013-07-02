BFI.MapView = Backbone.View.extend

  markers: []

  focusMap: (lat, long) ->
    @map.setView([lat, long], 14)

  render: () ->
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
  createMap: ->
    if not @map
      @map = new L.map('map')
        .setView([41.87, -87.65], 13)
        .addLayer(@createMapData())

  #if map is in the dom, place Markers
  render: ->
    if @map
      @removeMarkers()
      @placeMarkers()
    return @

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
            cause.attributes.name
          )
          @map.addLayer marker

          #add new marker to array for tracking/removal
          @markers.push marker
      
