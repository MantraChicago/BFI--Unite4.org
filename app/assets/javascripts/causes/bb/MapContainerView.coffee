###
MAKE SURE RENDER RETURNS THIS
The container view responds to events that change
which child views are rendered at any given time
MapView and List
or
GridView
###

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
    #(default is grid) alternative is "map"
    @activeState = "grid"

    #event listener to change the activeState
    @displayBus.onValue @, "changeState"
  
    #call render on filtered events on the collection
    @collection.on "filtered", @render, @

  #TODO: does not currently point to actul model data correctly
  #when our active model changes, perform these actions
  changeActive: (model) ->
    if model.lat and model.lng
      @map.focusMap model.lat, model.lng

  changeState: (state) ->
    @activeState = state
    @render()
    
  render: ->
    #empty the container's current content
    @$el.empty()

    #do whatever dom rendering is required for each state
    switch @activeState
      when "map" then @renderMap()
      when "grid" then @renderGrid()
      else throw new Error 'active State is invalid!'

    #insert the current dom tree 
    $('#mapcontainer').append @$el
    
    #if we are showing the map, we must draw it after the domnode
    #is inserted into the dom...unfortunate
    if @activeState is "map" then @map.afterRender()
      
    return @

  #called by render when map is active
  renderMap: ->
    @$el.append @causelist.render().$el
    @$el.append @map.render().$el
    return @
    
  #called by render when grid is active
  renderGrid: ->
    @$el.append @grid.render().$el
    return @
