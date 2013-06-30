Application.View = Backbone.View.extend
  initialize: (@options={})->
    _.extend(@, @options)
    Backbone.View::initialize.apply(@, arguments)

  applyTemplate: (templateIdentifier, variables={})->
    # TODO

  render: ()->
    @