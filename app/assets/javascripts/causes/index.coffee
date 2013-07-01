#= require_self
#= require_tree ./bb/templates
#= require ./bb/utils
#= require ./bb/CauseNavView
#= require ./bb/CauseItemView
#= require ./bb/CauseListView
#= require ./bb/CauseGridView
#= require ./bb/MapView
#= require ./bb/MapContainerView

window.BFI = {}

Application.causes ||= {}

Application.causes.index = ()->
  #create a bacon event bus.  change notice events 
  #will be pushed onto this from various sources
  filterBus = new Bacon.Bus()

  #render the cause navigation header
  causenav = new BFI.CauseNavView
    filterBus: filterBus

  #create child views for container at any given time, the 
  #container will determine which child views should be rendered
  map = new BFI.MapView
    id: "map"
  causelist = new BFI.CauseListView
    className: "causelist"
  causegrid = new BFI.CauseGridView
    className: "causegrid"

  #create map container view and pass in children
  mapcontainer = new BFI.MapContainerView
    className: "container"
    map: map
    grid: causegrid
    causelist: causelist
    filterBus: filterBus

  $('#mapcontainer').html mapcontainer.render().$el
  $('#causenav').html causenav.render().$el
  map.createMap(map.$el)
