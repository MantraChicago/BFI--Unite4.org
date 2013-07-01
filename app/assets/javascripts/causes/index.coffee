#= require_self
#= require_tree ./bb/templates
#= require ./bb/utils
#= require ./bb/CauseNavView
#= require ./bb/CauseItemView
#= require ./bb/CauseListView
#= require ./bb/MapView
#= require ./bb/MapContainerView

window.BFI = {}

Application.causes ||= {}

Application.causes.index = ()->
  #create a bacon event bus.  change notice events 
  #will be pushed onto this from various sources
  filterBus = new Bacon.Bus()

  #render the cause navigation header
  BFI.causenav = new BFI.CauseNavView
    $el: $ '#causenav'
    filterBus: filterBus

  #create child views for container at any given time, the 
  #container will determine which child views should be rendered
  BFI.map = new BFI.MapView()
  BFI.causelist = new BFI.CauseListView()
  BFI.causegrid = new BFI.CauseGridView()

  #create map container view and pass in children
  BFI.mapContainer = new BFI.MapContainerView
    $el: $ '#mapcontainer'
    map: BFI.map
    causelist: BFI.causelist
    causegrid: BFI.causegrid
    filterBus: filterBus

  #render nav and container
  BFI.causenav.render()
  BFI.mapContainer.render()
