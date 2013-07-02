#= require_self
#= require_tree ./bb/templates
#= require ./bb/utils
#= require ./bb/CausesCollection
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

  #create our collection that all views reference
  #collection emits "filtered" events which views subscribe to
  collection = new BFI.CausesCollection
    filterBus: filterBus
    cache: Application.collection 'causes'

  #render the cause navigation header
  causenav = new BFI.CauseNavView
    filterBus: filterBus

  #create child views for container at any given time, the 
  #container will determine which child views should be rendered
  map = new BFI.MapView
    id: "map"
  causelist = new BFI.CauseListView
    className: "causelist"
    collection: collection
  causegrid = new BFI.CauseGridView
    className: "causegrid"
    collection: collection

  #create map container view and pass in children
  mapcontainer = new BFI.MapContainerView
    className: "container"
    filterBus: filterBus
    map: map
    grid: causegrid
    causelist: causelist
    collection: collection

  $('#mapcontainer').html mapcontainer.render().$el
  $('#causenav').html causenav.render().$el
  #TODO: hacky.  would be better to trigger an afterRender event
  map.createMap(map.$el)
  #fetch our data!
  Application.collection('causes').fetch()
