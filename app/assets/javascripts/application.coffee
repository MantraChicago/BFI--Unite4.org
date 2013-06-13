#= require_tree ./templates
#= require ./views
#= require ./causes

$ ->
  body        = $('body')
  controller  = body.attr 'data-controller'
  action      = body.attr 'data-action'

  _.delay ()->
    $(".bar").removeClass('reset')
  , 500

  $('#header').quickSlider
    slides: 'header-slide'
    nav : 'header-label'

  # The instance of the application, all of the view, model, collection instances
  # which get created should get stored here
  window.App = {}

  # Use the controller name, and action name properties
  # stored on the body element, to delegate to a specific
  # controller / action function on the Application object.
  #
  # e.g.
  #
  # Will run on the causes show action only:
  #
  # Application.causes.show = ()->
  #
  # Will run on every causes controller page:
  #
  # Application.causes = ()->
  #
  Application[controller]?()
  Application[controller]?[action]?()



