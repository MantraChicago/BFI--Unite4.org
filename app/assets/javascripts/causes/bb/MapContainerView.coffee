#MAKE SURE RENDER RETURNS THIS
#The container view responds to events that change
#which child views are rendered at any given time
#MapView and List
#or
#GridView

BFI.MapContainerView = Backbone.View.extend

  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments

    #must pass in instantiated child views
    if not @map and @causelist and @grid
      throw new Error 'provide map, grid, causelist view instances'

    #TODO: this injection is ghetto...fix it
    #inject the container onto the causelist and map  
    @causelist.container = @
    @map.container = @
    @grid.container = @

    #configure the default state which determines child views
    # (default is grid) alternative is "map"
    @activeState = "grid"

    #configure our response to events on the filterBus
    @configureFilterBus()

  #broadcast up to the container from clicks on the list
  changeActive: (model) ->
    @map.focusMap model.lat, model.long
    
  #wire up responses to events on the filter bus
  #for this object, we will respond by triggering a change
  #in our data by filtering the local store with the values
  #in the recieved event object
  #TODO: wire up the bus to filter the collection
  configureFilterBus: ->
    @filterBus.onValue @applyFilter

  #hash used to determine which render method should be called
  renderHash:
    map: @renderMap
    grid: @renderGrid

  render:
    #render ourselves
    @$el.html(JST['causes/bb/templates/causecontainer'](@))
    #call the appropriate render method based on state
    @renderHash[@activeState]()

  #called by render when map is active
  renderMap: ->
    #render our children and re-establish bindings
    @causelist.setElement(@$('#childnode')).render()
    @map.setElement(@$('#map')).render()

    #TODO: place markers once causes have lat/long available
    @map.placeMarkers @causelist.collection.models.map(
      (model) -> model.toJSON()
    )
    return @
    
  #called by render when grid is active
  renderGrid: ->
    #render our children and re-establish bindings
    @causegrid.setElement(@$('#childnode')).render()
    return @
