#= require ./cause_listings
#= require ./super_navigation
#= require ./user_data
#= require ./apply_contribution_history
#= require_self

$('a[data-update]').on "click", (e)->
  e.preventDefault()

  $link   = $(e.currentTarget).closest("a")
  update  = $( $link.data('target') )

  return unless update.length is 1

  $.get $link.attr('href'), (response)->
    update.html(response)


