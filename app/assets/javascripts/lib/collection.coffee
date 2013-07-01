Application.Collection = Backbone.QueryCollection.extend
  model: Application.Model

  url: ()->
    "/api/v1/#{ @name }"

  initialize: (initialModels, @options={})->
    _.extend(@, @options)

    throw "Application.Collection classes must specify a name property" unless @name

    initialModels = @seedData()
    Backbone.QueryCollection.prototype.initialize.call(@, initialModels, @options)

  loadFromPage: ()->
    @reset(@seedData())

  seedData: ()->
    Application.data[@name] || []
