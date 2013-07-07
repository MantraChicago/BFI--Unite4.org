#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require jquery.easing.1.3.js
#= require jquery.isotope.min
#= require jquery.mousewheel.min
#= require jquery-quickslider
#= require underscore-min
#= require underscore-string.min
#= require backbone-min
#= require backbone-query.min
#= require foundation

#= require_self

$.ajaxSetup
  headers:
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')

$("*").on "ajax:beforeSend", (e, xhr, settings)->
  xhr.setRequestHeader("X-CSRF-Token", $('meta[name="csrf-token"]').attr('content'))
