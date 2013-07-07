# The way the site gets rendered, everythign is highly
# cacheable, and that means few if any of the content will be
# rendered with any sort of user specific data.
#
# We will want to update cause listings, and cause pages, etc
# and set the following status, the donation status, etc, etc
# for causes we are already following, have already donated to, etc
Application.applyContributionHistory = ->
  Application.updateFollowButtonsFor(App.user.get('followed_causes_ids'))

Application.updateFollowButtonsFor = (causeIds,options={})->
  options.text ||= "Followed"
  options.disable ||= true

  for causeId in causeIds
    button = $(".cause-listing[data-cause-id='#{ causeId }']").find('.fulfillment-button')
    button.find('.h5').text(options.text)

    if options.disable
      button.addClass('disabled')

