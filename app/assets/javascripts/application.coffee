#= require ./causes
#= require ./donations

$ ->
  _.delay ()->
    $(".bar").removeClass('reset')
  , 500

  $('#header').quickSlider
    slides: 'header-slide'
    nav : 'header-label'
