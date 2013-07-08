#= require_self

Application.setupFulfillmentModals = _.once ->
  $('.open-fulfillment-modal').on "click", (e)->
    $target = $(e.currentTarget).closest('.open-fulfillment-modal')
    needId = $target.data('need-id')
    typeOfNeed = $target.data('type-of-need')
    causeSlug = $target.data('cause-slug')

    debugger


