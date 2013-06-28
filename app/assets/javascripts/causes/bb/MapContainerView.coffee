#MAKE SURE RENDER RETURNS THIS

BFI.MapContainerView = Backbone.View.extend

  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments

    #must pass in instantiated child views
    if not @map and @causelist
      throw new Error 'must provide map and causelist view instances'

    #TODO: this injection is ghetto...fix it
    #inject the container onto the causelist and map  
    @causelist.container = @
    @map.container = @

    #configure our response to events on the filterBus
    @configureFilterBus()

  #broadcast up to the container from clicks on the list
  changeActive: (model) ->
    console.log model
    #@map.focusMap(model)
    
  #wire up responses to events on the filter bus
  #for this object, we will respond by triggering a change
  #in our data by filtering the local store with the values
  #in the recieved event object
  configureFilterBus: ->
    @filterBus.onValue((obj) -> console.log obj)

  render: ->
    #render ourselves
    @$el.html(JST['causes/bb/templates/causecontainer'](@))
    
    #render our children and re-establish bindings
    @causelist.setElement(@$('#causelist')).render()
    @map.setElement(@$('#map')).render()
    return @
