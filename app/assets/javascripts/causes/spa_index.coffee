#= require_self
#= require_tree ./bb/templates
#= require ./bb/utils
#= require ./bb/CausesCollection
#= require ./bb/CauseNavView
#= require ./bb/CauseItemView
#= require ./bb/CauseListView
#= require ./bb/CauseGridItemView
#= require ./bb/CauseGridView
#= require ./bb/MapView
#= require ./bb/MapContainerView

window.BFI = {}

Application.causes ||= {}

Application.causes.index = ()->
  
  #create a bacon event bus.  change notice events 
  #will be pushed onto this from various sources
  filterBus = new Bacon.Bus()
  displayBus = new Bacon.Bus()

  #create our collection that all views reference
  #collection emits "filtered" events which views subscribe to
  collection = new BFI.CausesCollection
    filterBus: filterBus
    cache: Application.collection 'causes'

  #render the cause navigation header
  causenav = new BFI.CauseNavView
    filterBus: filterBus
    displayBus: displayBus

  #create child views for container at any given time, the 
  #container will determine which child views should be rendered
  map = new BFI.MapView
    id: "map"
    collection: collection

  causelist = new BFI.CauseListView
    className: "causelist"
    collection: collection

  grid = new BFI.CauseGridView
    tagName: 'ul'
    className: "causegrid large-block-grid-4"
    collection: collection

  #create map container view and pass in children
  mapcontainer = new BFI.MapContainerView
    className: "container"
    filterBus: filterBus
    displayBus: displayBus
    map: map
    grid: grid
    causelist: causelist
    collection: collection

  $('#causenav').html causenav.render().$el

  #fetch our data!
  Application.collection('causes').fetch()
