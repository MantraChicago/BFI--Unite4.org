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
    @activeState = "map"

    @collection.on "filtered", @render, @

  #broadcast up to the container from clicks on the list
  changeActive: (model) ->
    @map.focusMap model.lat, model.long
    
  render: ->
    switch @activeState
      when "map" then @renderMap()
      when "grid" then @renderGrid()
      else throw new Error 'active State is invalid!'

  #called by render when map is active
  renderMap: ->
    @$el.append @causelist.render().$el
    @$el.append @map.render().$el
    return @
    
  #called by render when grid is active
  renderGrid: ->
    @$el.append @causegrid.render().$el
    return @
