Application.Collection = Backbone.QueryCollection.extend
  model: Application.Model

  url: ()->
    baseUrl = @resourceUrl()

    unless _.isEmpty(@filterParams)
      parts = []

      for key, value of @filterParams
        parts.push "#{key}=#{value}"

      baseUrl = baseUrl + "?#{ parts.join('&') }"

    baseUrl

  resourceUrl: ()->
    "/api/v1/#{ @name }/details"

  clearFilter: (options={})->
    @filterParams = {}


  remoteFilter: (@filterParams={}, options={})->
    @fetch(options)
    @

  initialize: (initialModels, @options={})->
    _.extend(@, @options)

    throw "Application.Collection classes must specify a name property" unless @name

    initialModels = @seedData()
    Backbone.QueryCollection.prototype.initialize.call(@, initialModels, @options)

  loadFromPage: ()->
    @reset(@seedData())

  seedData: ()->
    Application.data[@name] || []
