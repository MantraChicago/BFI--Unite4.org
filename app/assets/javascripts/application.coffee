#= require ./causes
#= require ./donations
#= require_tree ./templates

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


  Application[controller]?()
  Application[controller]?[action]?()



