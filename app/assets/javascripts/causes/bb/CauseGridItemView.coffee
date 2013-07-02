BFI.CauseGridItemView = Backbone.View.extend
  
  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments

  render: () ->
    @$el.html(JST['causes/bb/templates/causegriditem'](@model))
    return @
