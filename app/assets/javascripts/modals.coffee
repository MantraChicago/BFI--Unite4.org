Application.modals ||= {}

Application.modals.cash_donations = (options)->
  $('#modalWrapper').foundation 'reveal', 'open', "/causes/#{ slug }/#{ need_id }/new?partial=true"


