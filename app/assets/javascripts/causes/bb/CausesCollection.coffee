BFI.CausesCollection = Backbone.Collection.extend

  #define our current Filters
  #define the cache from which we obtain data
  #call our initial fetch
  initialize: (options) ->
    @currentFilters = {
      city: 'Chicago'
    }
    options.filterBus.onValue @, "updateFilters"
    @cache = options.cache

    #when our cache changes, call our synchronous fetch method
    @cache.on 'sync', @fetch, @

  #event fired when filters change
  updateFilters: (filter) ->
    @currentFilters = filter
    @fetch()

  #fetch a subset of models from our cache and assign the
  #result to models.  fire "filtered" event
  fetch: ->
    @models = @cache.query
      city: @currentFilters.city
    @trigger 'filtered'
