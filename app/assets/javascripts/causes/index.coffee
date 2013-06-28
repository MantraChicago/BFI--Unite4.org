#= require_self
#= require_tree ./bb/templates
#= require ./bb/utils
#= require ./bb/CauseNavView
#= require ./bb/CauseListView
#= require ./bb/MapView
#= require ./bb/MapContainerView

window.BFI = {}

Application.causes ||= {}

Application.causes.index = ()->
  #create a bacon event bus.  change notice events will
  #be pushed onto this from various sources
  filterBus = new Bacon.Bus()

  #render the cause navigation header
  BFI.causenav = new BFI.CauseNavView
    $el: $ '#causenav'
    filterBus: filterBus

  #create child views for map
  BFI.map = new BFI.MapView()
  BFI.causelist = new BFI.CauseListView()

  #create map container view and pass in children
  BFI.mapContainer = new BFI.MapContainerView
    $el: $ '#mapcontainer'
    map: BFI.map
    causelist: BFI.causelist
    filterBus: filterBus

  #render nav and container
  BFI.causenav.render()
  BFI.mapContainer.render()
