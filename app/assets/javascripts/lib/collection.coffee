Application.Collection = Backbone.QueryCollection.extend
  model: Application.Model

  url: ()->
    "/api/v1/#{ @name }"

  initialize: (initialModels=[], @options={})->
    _.extend(@, @options)

    Backbone.QueryCollection.prototype.initialize.apply(@, arguments)

    throw "Application.Collection classes must specify a name property" unless @name

    #@populateWithSeedData()

  # If data exists in the in memory Application.data object
  # matching the name of this collection, we should silently
  # load the collection with that data upon initialization
  populateWithSeedData: ()->
   seedData = Application.data[@name]

   if seedData?.length > 0
     @reset(seedData, silent: true)
