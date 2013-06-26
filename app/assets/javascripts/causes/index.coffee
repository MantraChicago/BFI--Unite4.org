window.BFI = Ember.Application.create
  rootElement: "#causesapp"

#= require './models/Cause.js'
#= require './router/router.js'
#= require './controllers/CausesController.js'
#= require './controllers/CauseController.js'

#= require './views/GridTileView.js'
#= require './views/GridView.js'
#= require './views/MapContainerView.js'

#= require './views/MapView.js'

#= require './views/CausesView.js'
#= require './views/CauseItemView.js'
#= require './views/CauseListView.js'
#= require './views/CausesGridView.js'
#= require './views/CausesMapView.js'
#= require_self
Application.causes ||= {}

Application.causes.index = ()->
