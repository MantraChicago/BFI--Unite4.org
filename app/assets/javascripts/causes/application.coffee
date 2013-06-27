#= require_self
#= require ./models/Cause
#= require ./router/router
#= require ./controllers/CausesController
#= require ./controllers/CauseController
#= require ./views/GridTileView
#= require ./views/GridView
#= require ./views/MapContainerView
#= require ./views/MapView
#= require ./views/CausesView
#= require ./views/CauseItemView
#= require ./views/CauseListView
#= require ./views/CausesGridView
#= require ./views/CausesMapView

window.BFI = Ember.Application.create
  rootElement: "#causesapp"
  LOG_ACTIVE_GENERATION: true
  LOG_VIEW_LOOKUPS: true
  LOG_TRANSITIONS: true
