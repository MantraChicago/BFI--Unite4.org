BFI.CauseNavView = Backbone.View.extend
  
  #list of possible causes/cities for filters
  causes: [ 'Arts', 'Education',
            'Environment', 'Health & Wellness'
            'Youth', 'Religion',
            'Global Outreach', 'Social Equality']

  cities: ['Chicago', 'New York', 'San Francisco']
  
  events:
    "change #cityselect": "pushToFilterBus"
    "change #causeselect": "pushToFilterBus"
    
  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments
    
  #change events from filter selectors are converted into filter
  #objects and pushed onto the filterBus
  pushToFilterBus: () ->
    @filterBus.push
      city: @$('#cityselect').val()
      cause: @$('#causeselect').val()

  render: ->
    @$el.html(JST['causes/bb/templates/causenav'](@))
    #push our initial filtration setup to the filterBus
    @pushToFilterBus()
    return @
