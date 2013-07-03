BFI.CauseGridView = Backbone.View.extend
 
  initialize: (options) ->
    #view setup boilerplate
    _.extend(@, options)
    Backbone.View.prototype.initialize.apply @, arguments

  render: () ->
    @$el.html ""

    @collection.each( ((cause) ->
      causeItem = new BFI.CauseGridItemView
        model: cause.toJSON()
        tagName: 'li'
        className: "causegriditem"
        container: @container
      @$el.append causeItem.render().$el
    ), @)
    return @
