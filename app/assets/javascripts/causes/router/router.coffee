BFI.Router.map ->
  @resource "causes", {path: '/'}, ->
    @route "map"
    @route "grid"

BFI.QueryRoute = Ember.Route.extend
  #returns object w/ type and filter
  parseQuery: () ->
    query = {}
    url = document.URL
    #take the portion after the ? token
    queryString = url.split("?")[1]
    query.type = queryString.split("=")[0]
    query.filter = queryString.split("=")[1]
    return query

BFI.IndexRoute = BFI.QueryRoute.extend
  redirect: ->
    @replaceWith "causes"

BFI.CausesRoute = BFI.QueryRoute.extend
  events:
    showmap: ->
      @transitionTo "causes.map"
    showgrid: ->
      @transitionTo "causes.grid"

  setupController: (controller) ->
    query = @parseQuery()
    console.log query
    
    ###
    refs to controllers.  We need to populate each 
    with data available in Application global cache
    (possibly reduced by filters)
    ###

    locationsCon = controller.get 'controllers.locations'
    needsCon = controller.get 'controllers.needs'
    #fetch will ajax for data, then assign the returned data to content
    controller.populate Application.data.causes
    locationsCon.populate Application.data.locations
    needsCon.populate Application.data.needs

BFI.CausesGridRoute = BFI.QueryRoute.extend
  renderTemplate: ->
    controller = @controllerFor 'causes'
    @render "causes/grid", {into: 'causes', controller: controller}

BFI.CausesMapRoute = BFI.QueryRoute.extend
  renderTemplate: ->
    controller = @controllerFor 'causes'
    @render "causes/map", {into: 'causes', controller: controller}
