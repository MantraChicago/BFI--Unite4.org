Application.setupCauseListingEvents = _.once ->
  $('.cause-listing .fulfillment-button').click(handleFulfillmentClick)

  $('.cause-follow-button').click (e)->
    e.preventDefault()
    $target   = $(e.currentTarget)
    handlers.followers(url: $target.attr('href'))


handleFulfillmentClick = (e)->
  $target   = $(e.currentTarget)
  $listing  = $target.parents('[data-cause-id]')
  settings  = $listing.data()

  if handler = handlers[settings.typeOfNeed]
    handler(settings)

handlers =
  followers: (params)->
    $.ajax
      type: "POST"
      url: params.url || "/causes/#{ params.causeSlug }/followers"
      data:
        need_id: params.needId
      complete: (response, status)->
        if response.status is 401
          window.location.href = "/users/sign_in?return_to=#{ window.location.href }"
        else
          window.location=window.location # just refresh the page 




