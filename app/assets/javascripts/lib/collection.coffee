Application.Collection = Backbone.QueryCollection.extend
  model: Application.Model

  url: ()->
    "/api/v1/#{ @name }"

  initialize: (initialModels=[], @options={})->
    _.extend(@, @options)

    Backbone.QueryCollection::initialize.apply(@, arguments)

    throw "Application.Collection classes must specify a name property" unless @name
