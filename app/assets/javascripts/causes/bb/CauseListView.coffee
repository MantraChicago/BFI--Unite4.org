BFI.CauseListView = Backbone.View.extend

  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments
    
  #TODO: this could be done more efficiently with less writes directly
  #into the DOM!  Use a staging view
  render: ->
    #clear the current HTML
    @$el.html ""

    @collection.each( ((cause) ->
      causeItem = new BFI.CauseItemView
        model: cause.toJSON()
        className: "cause"
        container: @container
      @$el.append causeItem.render().$el
    ), @)
    return @
