#= require ./causes
#= require ./donations
#= require_tree ./templates

$ ->
  _.delay ()->
    $(".bar").removeClass('reset')
  , 500

  $('#header').quickSlider
    slides: 'header-slide'
    nav : 'header-label'
