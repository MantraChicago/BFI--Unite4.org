BFI.CauseItemView = Backbone.View.extend

  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments

  events:
    "click": "makeActive"

  #active model has changed, call changeActive on container
  makeActive: ->
    @container.changeActive @model.locations_details[0]

  render: ->
    @$el.html(JST['causes/bb/templates/causeitem'](@model))
    return @
