Application.views.GoogleMapsPanel = Backbone.View.extend
  initialize:(@options={})->
    _.extend(@, @options)

    @setElement $('#map-canvas')

  createMap: ()->
    mapOptions =
      center: new google.maps.LatLng(41.85, -87.65)
      zoom: 6
      mapTypeId: google.maps.MapTypeId.ROADMAP

    @map = new google.maps.Map(@$el[0], mapOptions);

  render: ()->
    @createMap()

