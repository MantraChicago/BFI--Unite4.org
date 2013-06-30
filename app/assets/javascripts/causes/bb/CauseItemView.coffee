BFI.CauseItemView = Backbone.View.extend

  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments

  events:
    "click": "makeActive"

  #alert the container that active model has changed
  makeActive: ->
    @container.changeActive @model

  render: () ->
    @$el.html(JST['causes/bb/templates/causeitem'](@model))
    return @
