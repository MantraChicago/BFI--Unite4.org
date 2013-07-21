window.Unite ||= {}

class Unite.EventTracker
  constructor: (@options={})->
    _.extend(@, @options)

  endpointFor: (eventName,attributes={})->
    "/api/v1/event_tracking"

  trackEvent: (eventName, attributes={})->
    $.ajax
      type: "POST"
      url: @endpointFor(eventName, attributes)
      data: JSON.stringify
        eventName: eventName
        attributes: attributes
