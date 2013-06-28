BFI.CauseNavView = Backbone.View.extend
  
  #list of possible causes/cities for filters
  causes: [ 'Arts', 'Education', 'Environment', 'Health'
            'Youth', 'Religion', 'Outreach', 'Social']

  cities: ['Chicago', 'New York', 'San Francisco']
  
  events:
    "change #cityselect": "pushToFilterBus"
    "change #causeselect": "pushToFilterBus"
    
  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments
    
    #configure our filterBus
    #@configureFilterBus()

  #change events from filter selectors are converted into filter
  #objects and pushed onto the filterBus
  pushToFilterBus: () ->
    @filterBus.push
      city: @$('#cityselect').val()
      cause: @$('#causeselect').val()

  render: ->
    @$el.html(JST['causes/bb/templates/causenav'](@))
    return @
