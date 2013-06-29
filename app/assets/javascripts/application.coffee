# The templates are compiled by the asset pipeline and provide us with functions to
# render strings.  We should use either template.jst.hamlc or template.jst.skim.
//= require_tree ./templates

# The lib directory contains base classes that our models, views, collections extend from.
# As well as any other utility classes, etc

#= require_tree ./lib

# The components folder should be used to store re-usable view elements

#= require_tree ./components

# The data sources contain our collection manager, and all of the collections
# and models which map our restful API endpoints

#= require ./data_sources

#= require ./causes/index
#= require ./causes/show

# The On Ready function routes to a function on the Application namespace
# based on the body class, and body id.  It will run a function that matches
# the name of the class, and a function which matches the name of the id
Application.onReady = ->
  body        = $ 'body'

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
  window.App = new Application.App
    controller: controller
    action: action

  App.initializePage()

$(Application.onReady)
