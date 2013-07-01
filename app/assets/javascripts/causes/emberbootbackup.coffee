#= require_self
#= require ./router/router

#= require ./models/Model
#= require ./models/Need
#= require ./models/Cause
#= require ./models/Location

#= require ./controllers/CausesController
#= require ./controllers/NeedsController
#= require ./controllers/LocationsController

#= require ./controllers/CauseController

#= require ./views/GridTileView
#= require ./views/GridView

#= require ./views/CauseListView
#= require ./views/MapView
#= require ./views/MapContainerView

#= require ./views/CausesView
#= require ./views/CauseItemView
#= require ./views/CausesGridView
#= require ./views/CausesMapView

window.BFI = Ember.Application.create
  rootElement: "#causesapp"
  #LOG_ACTIVE_GENERATION: true
  #LOG_VIEW_LOOKUPS: true
  #LOG_TRANSITIONS: true

Application.causes ||= {}

Application.causes.index = ()->
  console.log 'yo'