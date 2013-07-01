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
    @activeState = "map"

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

  render: ->
    switch @activeState
      when "map" then @renderMap()
      when "grid" then @renderGrid()

  #called by render when map is active
  renderMap: ->
    @$el.append @causelist.render().$el
    @$el.append @map.render().$el
    return @
    
  #called by render when grid is active
  renderGrid: ->
    @$el.append @causegrid.render().$el
    return @
