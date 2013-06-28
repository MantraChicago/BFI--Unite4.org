#MAKE SURE RENDER RETURNS THIS

BFI.MapContainerView = Backbone.View.extend

  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments

    #must pass in instantiated child views
    if not @map and @causelist
      throw new Error 'must provide map and causelist view instances'

    #define the target nodes for each child view
    @mapNode = @$ '#map'
    @causelistNode = @$ '#causelist'

    #configure our response to events on the filterBus
    @configureFilterBus()

  #TRADITIONAL BB EVENTS
  events:
    "click .cause":     "clickCause"
  
  #BB EVENT HANDLERS
  clickCause: (event) ->
    @map.focusMap()
    
  #wire up responses to events on the filter bus
  #for this object, we will respond by triggering a change
  #in our data by filtering the local store with the values
  #in the recieved event object
  configureFilterBus: ->
    @filterBus.onValue((obj) -> console.log obj)

  render: ->
    #render ourselves
    @$el.html(JST['causes/bb/templates/causelist'](@))
    
    #render our children
    @mapNode.html @map.render().el
    @causelistNode.html @causelist.render().el
    return @

  
