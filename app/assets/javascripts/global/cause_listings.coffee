Application.setupCauseListingEvents = _.once ->
  $('.cause-listing .fulfillment-button').click(handleFulfillmentClick)

handleFulfillmentClick = (e)->
  $target   = $(e.currentTarget)
  $listing  = $target.parents('[data-cause-id]')
  settings  = $listing.data()

  console.log settings

  if handler = handlers[settings.typeOfNeed]
    handler(settings)

handlers =
  followers: (params)->
    $.ajax
      type: "POST"
      url: "/causes/#{ params.causeSlug }/followers"
      data:
        need_id: params.needId
      complete: (response, status)->
        if response.status is 401
          window.location.href = "/users/sign_in?return_to=#{ window.location.href }"



